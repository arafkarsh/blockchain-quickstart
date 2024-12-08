// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Functions Modifier: Basic / Inputs / Sandwich
contract FunctionModifier {
    bool public running = true;
    uint private counter;
    // Basic Modifier
    modifier whenRunning() {
        require(running == true, "Running = false");
        _; // Execute the target Function Code
    }
    // Increment the Counter ONLY when Running = true
    function increment() external whenRunning {
        counter += 1;
    }
    // Decrement the Counter ONLY when Running = true
    function decrement() external whenRunning {
        counter -= 1;
    }
    // Modifier with Inputs: Value > Limit
    modifier min(uint _value) {
        require(_value > 100, "Value < 101");
        _; // Execute the target function code
    }
    // Check the input _value against min value in the Modifier
    function incrementBy(uint _value) external whenRunning min(_value) {
        counter += _value;
    }
    // Sandwich Modifier
    modifier sandwich() {
        counter = 21; // Execute Modifier Code
        _; // Execute Target Function Code
        counter += 3; // Execute Modifier Code again
    }
    function kat() external sandwich {
        counter -= 16;
    }
    // Stop the Contract
    function stop() external {
        running = false;
    }
    // Start the Contract
    function start() external {
        running = true;
    }
    function getCounter() external view returns (uint) {
        return counter;
    }
}