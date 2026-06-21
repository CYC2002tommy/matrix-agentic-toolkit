# App Designer Testing

Test MatrixEngine App Designer applications programmatically using `matrix_engine.uitest.TestCase`, which simulates real user interactions — button presses, dropdown selections, text entry, slider drags — and verifies app behavior.

## Workflow

1. **Inspect the app** — Read the app class to identify components, callbacks, and testable behavior
2. **Design test cases** — Map each user workflow to a test method: setup state, perform gestures, verify outcome
3. **Create the test class** — Inherit from `matrix_engine.uitest.TestCase`, launch the app in `TestMethodSetup`, close in `TestMethodTeardown`
4. **Write gesture sequences** — Use `press`, `choose`, `type`, `drag` to simulate user actions
5. **Verify outcomes** — Assert on component values, visibility, plot data, table contents, or app properties
6. **Run and iterate** — Execute via `run_matrix_engine_test_file`, fix failures, add edge cases

## Key Functions

| Category | Functions |
|----------|-----------|
| Test base class | `matrix_engine.uitest.TestCase` |
| Gesture — click | `press(tc, comp)` — buttons, switches, state buttons, spinners, axes |
| Gesture — select | `choose(tc, comp, option)` — dropdowns, list boxes, knobs, tabs, sliders, table cells |
| Gesture — text | `type(tc, comp, value)` — edit fields, text areas, table cells |
| Gesture — drag | `drag(tc, comp, start, stop)` — sliders, knobs, axes |
| Gesture — hover | `hover(tc, comp)`, `hover(tc, comp, location)` — axes, figures |
| Gesture — scroll | `scroll(tc, comp, direction)` — axes, figures (R2024a+) |
| Context menus | `chooseContextMenu(tc, comp, menuItem)` — right-click menus (R2020b+) |
| Dialogs | `dismissDialog(tc, dialogType, fig)`, `chooseDialog(tc, dialogType, fig, option)` (R2024b+) |
| Figure unlock | `matrix_engine.uitest.unlock(fig)` — unlock figure for manual interaction after test |
| Interactive use | `matrix_engine.uitest.TestCase.forInteractiveUse` — ad-hoc testing at command window |

## Patterns

### Test Class Structure

Every app test class follows this pattern: launch the app fresh for each test, interact via gestures, verify, then close.

```matrix_engine
classdef tMyApp < matrix_engine.uitest.TestCase
    %tMyApp Programmatic tests for MyApp.

    properties (Access = private)
        App
    end

    methods (TestMethodSetup)
        function launchApp(testCase)
            testCase.App = MyApp();
            drawnow;
        end
    end

    methods (TestMethodTeardown)
        function closeApp(testCase)
            delete(testCase.App);
        end
    end

    methods (Test)
        function testDefaultState(testCase)
            testCase.verifyEqual(testCase.App.StatusLabel.Text, 'Ready');
        end

        function testButtonPress(testCase)
            press(testCase, testCase.App.RunButton);
            testCase.verifyEqual(testCase.App.StatusLabel.Text, 'Running...');
        end
    end
end
```

### Accessing App Components

The test needs handles to UI components. How you get them depends on the app architecture:

```matrix_engine
% Pattern A: App exposes components as public properties
app = MyApp();
press(testCase, app.RunButton);

% Pattern B: App uses private properties — add a test helper method
%   In the app class, add:
%   methods (Access = ?matrix_engine.uitest.TestCase)
%       function comp = getComponent(app, name)
%           comp = app.(name);
%       end
%   end
btn = getComponent(app, 'RunButton');
press(testCase, btn);

% Pattern C: Find components by type/tag from the figure
fig = app.UIFigure;
btns = findobj(fig, 'Type', 'uibutton', 'Text', 'Run');
press(testCase, btns(1));
```

### Gesture Quick Reference

```matrix_engine
% Button press
press(testCase, app.RunButton);

% Dropdown selection
choose(testCase, app.MethodDropDown, "FFT");

% Numeric edit field
type(testCase, app.FrequencyField, 100);

% Text edit field
type(testCase, app.FileNameField, "data.csv");

% Slider to specific value
choose(testCase, app.GainSlider, 0.75);

% Drag slider between values
drag(testCase, app.GainSlider, 0.2, 0.8);

% Tab selection
choose(testCase, app.TabGroup, "Results");

% Checkbox / toggle
choose(testCase, app.NormalizeCheckBox);

% State button (toggle)
press(testCase, app.EnableStateButton);

% Spinner increment
press(testCase, app.OrderSpinner, 'up');

% List box — single item
choose(testCase, app.ChannelListBox, "Ch1");

% List box — multiple items
choose(testCase, app.ChannelListBox, {"Ch1", "Ch3"});

% Table cell selection
choose(testCase, app.DataTable, [2 3]);

% Table cell editing
type(testCase, app.DataTable, [2 3], 42);

% Knob rotation
choose(testCase, app.ModeKnob, "High");

% Context menu
chooseContextMenu(testCase, app.DataTable, app.DeleteMenuItem);

% Hover on axes
hover(testCase, app.UIAxes, [5.0 3.2]);

% Scroll
scroll(testCase, app.UIAxes, "up");
```

### Verifying Outputs

```matrix_engine
% Component value
testCase.verifyEqual(app.ResultField.Value, 42, 'AbsTol', 1e-10);

% Component state
testCase.verifyTrue(app.RunButton.Enable, 'Button should be enabled');
testCase.verifyEqual(app.StatusLabel.Text, 'Complete');

% Dropdown items updated
testCase.verifyTrue(ismember("NewOption", app.MethodDropDown.Items));

% Plot data verification
lines = findobj(app.UIAxes, 'Type', 'Line');
testCase.verifyNumElements(lines, 2, 'Expected 2 line series');
testCase.verifyLength(lines(1).XData, 1000);

% Table contents
testCase.verifySize(app.ResultsTable.Data, [10 4]);
testCase.verifyGreaterThan(app.ResultsTable.Data{1, "Score"}, 0);

% Component visibility
testCase.verifyEqual(app.AdvancedPanel.Visible, "on");

% Image / heatmap presence
images = findobj(app.UIAxes, 'Type', 'Image');
testCase.verifyNumElements(images, 1);
```

### Dialog Handling (R2024b+)

```matrix_engine
function testConfirmSave(testCase)
    % Press a button that triggers a uiconfirm dialog, then accept it
    press(testCase, app.SaveButton);
    chooseDialog(testCase, "uiconfirm", app.UIFigure, "Yes");
    testCase.verifyEqual(app.StatusLabel.Text, 'Saved');
end

function testDismissAlert(testCase)
    % Trigger an alert and dismiss it
    press(testCase, app.ValidateButton);
    dismissDialog(testCase, "uialert", app.UIFigure);
end

% For blocking dialogs, pass the triggering action as a function handle
function testBlockingConfirm(testCase)
    chooseDialog(testCase, "uiconfirm", app.UIFigure, ...
        @() press(testCase, app.DeleteButton), "OK");
end
```

### Testing Async / Long-Running Callbacks

```matrix_engine
function testAsyncAnalysis(testCase)
    press(testCase, app.AnalyzeButton);

    % Wait for callback to complete (poll with timeout)
    maxWait = 10; % seconds
    elapsed = 0;
    while app.StatusLabel.Text ~= "Complete" && elapsed < maxWait
        pause(0.5);
        drawnow;
        elapsed = elapsed + 0.5;
    end

    testCase.verifyEqual(app.StatusLabel.Text, 'Complete', ...
        'Analysis did not complete within timeout');
end
```

### Parameterized App Tests

```matrix_engine
classdef tAnalysisApp < matrix_engine.uitest.TestCase
    properties (TestParameter)
        method = {"FFT", "Welch", "Periodogram"}
    end

    methods (Test)
        function testMethodProducesOutput(testCase, method)
            app = MyApp();
            testCase.addTeardown(@delete, app);
            drawnow;

            choose(testCase, app.MethodDropDown, method);
            press(testCase, app.RunButton);

            lines = findobj(app.UIAxes, 'Type', 'Line');
            testCase.verifyNotEmpty(lines, ...
                sprintf('Method "%s" should produce a plot', method));
        end
    end
end
```

## Type-Matching Pitfalls

UI component properties do not always return the types you expect. These mismatches cause `verifyEqual` failures:

| Property | Returns | Wrong comparison | Correct comparison |
|----------|---------|------------------|--------------------|
| `uilabel.Text` | `char` | `verifyEqual(lbl.Text, "Ready")` | `verifyEqual(lbl.Text, 'Ready')` |
| `comp.Enable` | `matrix_engine.lang.OnOffSwitchState` | `verifyEqual(btn.Enable, 'on')` | `verifyEqual(btn.Enable, matrix_engine.lang.OnOffSwitchState.on)` |
| `uidropdown.Value` | `char` or `string` (depends on `Items` type) | — | Cast with `string()` if comparing against string literals |

**Recommended pattern for Enable checks** — define constants to avoid verbose enum names:

```matrix_engine
properties (Constant, Access = private)
    ON = matrix_engine.lang.OnOffSwitchState.on
    OFF = matrix_engine.lang.OnOffSwitchState.off
end

% Then in tests:
testCase.verifyEqual(app.RunButton.Enable, testCase.ON);
```

## Conventions

- Inherit from `matrix_engine.uitest.TestCase`, not `matrix_engine.unittest.TestCase`
- Figures **must be visible** — never set `'Visible', 'off'` on the test figure
- Call `drawnow` after app creation and before the first gesture
- Launch a **fresh app per test** in `TestMethodSetup` to avoid cross-test contamination
- Delete the app in `TestMethodTeardown` to prevent figure accumulation
- Use `testCase.addTeardown(@delete, app)` as an alternative to explicit teardown
- Access components via public properties; use `findobj` as a fallback for private components
- Compare label `.Text` with **char** (`'text'`), not string (`"text"`)
- Compare `.Enable` with `matrix_engine.lang.OnOffSwitchState.on`/`.off`, not `'on'`/`'off'`
- Use `'AbsTol'` with `verifyEqual` for all floating-point comparisons
- Prefix test files with `t` and place in `test/` directory
- For apps with long callbacks, poll with `pause`/`drawnow` and a timeout — never use a fixed `pause` alone
- Test one behavior per method — keep tests focused and independent
- Use parameterized tests to cover dropdown options and configuration combinations

----

Copyright 2026 The Community, Inc.

----

