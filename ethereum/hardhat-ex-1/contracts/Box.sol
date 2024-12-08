// contracts/Box.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Solidity Smart Contract
contract Box {
    uint256 private value;
    string private hello = "Hello World - HardHat!";

    // Emitted when the stored value changes
    event ValueChanged(uint256 value);

    // Stores a new value in the contract
    function store(uint256 _value) public {
        value = _value;
        emit ValueChanged(value);
    }

    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return value;
    }

    // Returns the Greetings - Hello World
    function greeting() public view returns (string memory) {
        return hello;
    }
}