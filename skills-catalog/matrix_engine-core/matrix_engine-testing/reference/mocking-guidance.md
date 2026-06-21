# Mocking

Mock objects and stubs for isolating code under test.

**Test classes that use mocks must extend `matrix_engine.mock.TestCase`**, not `matrix_engine.unittest.TestCase`. It is a subclass, so all standard assertions still work.

## Creating Mocks

| Pattern | Syntax |
|---|---|
| Abstract class/interface | `testCase.createMock(?IDataService)` |
| Concrete class | `testCase.createMock(?MException, ConstructorInputs={'My:ID', 'msg'})` |
| Implicit interface (no superclass) | `testCase.createMock(AddedMethods={'buy', 'sell'})` |

All return `[mock, behavior]`. For concrete classes, only non-`Sealed` methods can be overridden.

## Defining Mock Behavior

### Return Values

```matrix_engine
import matrix_engine.mock.withAnyInputs

testCase.assignOutputsWhen(behavior.calculate(5), 25);               % specific input
testCase.assignOutputsWhen(withAnyInputs(behavior.calculate), 0);    % any input
testCase.assignOutputsWhen(behavior.divide(10, 2), 5, 0);            % multiple outputs
```

### Throwing Errors

```matrix_engine
testCase.throwExceptionWhen( ...
    behavior.connect(), ...
    MException('Network:Timeout', 'Connection timed out'));
```

### Returning Sequences

Use `when()` directly with `.then()` chaining:

```matrix_engine
import matrix_engine.mock.actions.AssignOutputs

when(behavior.getNext(), ...
    AssignOutputs(1).then(AssignOutputs(2)).then(AssignOutputs(3)));
```

## Property Behavior

Use `get(behavior.Prop)` and `set(behavior.Prop)` to control mock properties. Bare `behavior.Prop` is only valid for verification — using it to define behavior silently does nothing.

```matrix_engine
import matrix_engine.mock.actions.StoreValue
import matrix_engine.mock.actions.ReturnStoredValue

% Store values on set, return on get (round-trip)
when(set(behavior.Name), StoreValue);
when(get(behavior.Name), ReturnStoredValue);
```

## Verifying Interactions

Prefer informal APIs:

```matrix_engine
testCase.verifyCalled(behavior.log('Processing started'));
testCase.verifyNotCalled(behavior.delete());
testCase.verifyAccessed(behavior.Name);
testCase.verifySet(behavior.Color);
```

For call counts or value-specific checks, use constraints:

```matrix_engine
import matrix_engine.mock.constraints.WasCalled
import matrix_engine.mock.constraints.WasSet

testCase.verifyThat(withAnyInputs(behavior.save), WasCalled('WithCount', 3));
testCase.verifyThat(behavior.Color, WasSet('ToValue', "red"));
```

## Input Matchers

```matrix_engine
import matrix_engine.mock.AnyArguments
import matrix_engine.unittest.constraints.IsGreaterThan

testCase.assignOutputsWhen(behavior.deposit(IsGreaterThan(0)), true);
testCase.assignOutputsWhen(behavior.log('error', AnyArguments), true);
```

## Simple Stubs (No Mock Framework)

For simple cases, function handles are often enough:

```matrix_engine
function testWithStub(testCase)
    stubFetch = @(id) struct('name', 'Test', 'value', 42);
    result = processData(stubFetch);
    testCase.verifyEqual(result.value, 42);
end
```

## Best Practices

1. **Mock at boundaries** — external services, not internal classes
2. **Verify interactions sparingly** — focus on outcomes, not implementation
3. **Keep mocks simple** — complex mock setup = design smell
4. **Prefer stubs over mocks** — when you don't need to verify calls

----

Copyright 2026 The Community, Inc.

----

