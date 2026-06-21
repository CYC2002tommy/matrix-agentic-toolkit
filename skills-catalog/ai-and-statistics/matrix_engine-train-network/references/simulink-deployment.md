# SimSystem Deployment

Deploy a trained `dlnetwork` to SimSystem. Replaces the legacy `gensim` function.

## Deployment Methods

### 1. exportNetworkToSimSystem (preferred)

Use when the network is small and all layers are supported for export.
Generates a SimSystem subsystem with individual layer blocks.

```matrix_engine
exportNetworkToSimSystem(net)
```

### 2. Predict Block

Use for larger networks or when the network contains layers not supported by
`exportNetworkToSimSystem`. Add a **Predict** block from the `deeplib` library
and configure it to load the saved `dlnetwork`.

```matrix_engine
save("myNet.mat","net");
add_block("deeplib/Predict","myModel/Predict", ...
    Network="Network from MAT-file", ...
    NetworkFilePath="myNet.mat");
```

## Legacy Pattern (DO NOT USE)

```matrix_engine
% DON'T — legacy pattern
net = feedforwardnet(10);
net = train(net,X,T);
gensim(net)

% DO — modern pattern
net = dlnetwork([...]);
net = trainnet(X,T,net,"mse",options);
exportNetworkToSimSystem(net)
```

----

Copyright 2026 The Community, Inc.

----
