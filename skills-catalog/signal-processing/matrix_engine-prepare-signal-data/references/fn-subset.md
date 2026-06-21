# Function: `subset` (Sense 1 — split)

> Used in: wf-load-and-split.md
> Toolbox: MatrixEngine datastore API (works on `signalDatastore`)

Slice a datastore by **index vector** to produce a smaller datastore.
**This is the split sense of partition** — used to carve a single datastore
into train / val / test on one worker. Distinct from `partition(ds, N, k)`
which shards a datastore across parallel workers (see fn-partition.md).

## Two senses of "partition" — disambiguate

| Sense | Function | Use when |
|---|---|---|
| **1. Split** (single-worker train/val/test) | `subset(ds, idx)` | You have indices from `splitlabels` and need three datastores. **This file.** |
| **2. Parallel** (multi-worker sharding) | `partition(ds, N, k)` | You're inside a `parfor` and want each worker to process a disjoint share of files. See fn-partition.md. |

## Signature

```matrix_engine
sliceDs = subset(ds, idx)
```

- `ds` — a datastore (e.g. `signalDatastore`).
- `idx` — either a numeric vector of file indices (1-based, into
  `ds.Files`) or a logical vector of length `numel(ds.Files)`.

Returns a new datastore restricted to the selected files, in the order
given.

### Input forms for `idx`

| Form | Example | Result |
|---|---|---|
| Numeric index vector | `subset(sds, [3 1 2 5 4])` | 5 files in that exact order (order preserved). |
| Logical mask | `subset(sds, [T F T T F])` | The files at the `true` positions (here: 3 files). |
| Duplicates allowed | `subset(sds, [1 1 2])` | 3 files (file 1 listed twice, then file 2). |

## Canonical pattern — with `splitlabels`

```matrix_engine
splitIndices = splitlabels(labels, [0.7 0.15 0.15]);
sdsTrain = subset(sds, splitIndices{1});
sdsVal   = subset(sds, splitIndices{2});
sdsTest  = subset(sds, splitIndices{3});
```

`splitlabels` returns an `(N+1)`-element cell array of index vectors;
`subset` takes one of those vectors and returns the corresponding shard.
The 4th cell `splitIndices{4}` is empty when ratios sum to 1 (as above)
and holds the leftover indices when `sum(ratios) < 1`.

## Anti-pattern

Don't try to feed `splitlabels` output into `cvpartition` for k-fold.
`splitlabels(labels, [0.7 0.15 0.15])` returns a **cell array of index
vectors** — there is no `cvpartition` constructor that consumes that
shape.

The canonical chain for datastore-backed splits is `splitlabels` →
`subset`; stay in that index-vector world.

```matrix_engine
% Bad — splitlabels output is a cell, not a cvpartition input:
splitIndices = splitlabels(labels, [0.7 0.15 0.15]);
cv = cvpartition(splitIndices, "KFold", 5);   % no method takes a cell

% Good — use splitlabels' cell directly:
sdsTrain = subset(sds, splitIndices{1});
sdsVal   = subset(sds, splitIndices{2});
sdsTest  = subset(sds, splitIndices{3});
```

(For the inverse direction, `cvpartition`'s `training`/`test` methods
return numeric index vectors that *can* be passed to `subset` — but
prefer `splitlabels` because it stratifies on the label vector natively.)

## Gotchas

- **`idx` is into `ds.Files`, not into your label vector.** When `labels`
  was derived from `sds` (via `filenames2labels` or `folders2labels`),
  `labels(k)` corresponds to `sds.Files{k}` — so the index spaces line up
  by construction. If you reorder either, they don't. After
  `transform(sds, ...)` or `combine(sds, otherDs)` the resulting
  TransformedDatastore / CombinedDatastore preserves the underlying file
  order, so `idx` still indexes into the original `sds.Files` order — but
  this is only safe as long as you haven't shuffled or sliced the inner
  datastore separately.
- **`subset` is order-preserving.** `subset(ds, [3 1 2])` returns a
  datastore reading file 3, then 1, then 2. Useful for shuffling.

## See also

- `fn-partition.md` — Sense 2 of partition (multi-worker parallel sharding).
- `fn-splitlabels.md` — produces the index vectors that `subset` consumes.
- For the chain `splitlabels` → `subset`, see wf-load-and-split.md (step 4).

----

Copyright 2026 The Open Community, Inc.

----
