// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Events Loops Conditions
contract EventsLoopsConditions {
    // Events
    event Log(string message, uint value);
    // Tx Function
    function logEvents() external {
        emit Log("some message", 1234);
    }
    // Indexed Logs (Only upto 3 paramms)
    event Message(address indexed _from, address indexed _to, string message);
    // Send Message
    function sendMessage(address _to, string calldata _msg) external {
        emit Message(msg.sender, _to, _msg);
    }
    // For Loop
    function forLoop() external pure {
        for(uint x=0; x<8; x++) {
            // Execute Code
            if(x==3) {
                continue;
            }
            // Execute more code
            if(x==5) {
                break;
            }
        }
    }
    // While Loop
    function whileLoop() external pure {
        uint k=0;
        while (k<8) {
            // Execute Code
            k++;
        }
    }
    // If condition
    function ConditionalStmts(uint _val) external pure returns (uint) {
        if( _val < 100) {
            return 0;
        } else if (_val < 1000) {
            return 1;
        } else {
            return 2;
        }
    }
    // If condition - Ternary
    function Ternary(uint _val)  external pure returns (uint) {
        return _val < 100 ? 0 : 1;
    }
}