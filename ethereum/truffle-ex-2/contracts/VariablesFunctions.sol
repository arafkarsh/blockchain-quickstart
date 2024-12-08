// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
// State / Local / Global Variables. Function Visibility, View and Pure, 
// Function Fallback and Receive, Function with Multiple Outputs
contract VariablesFunctions {
  // Funcitioon Visibility
  // ----------------------------------------------------------------------
  // private  - ONLY INSIDE the Contract
  // internal - ONLY INSIDE the Contract and CHILD Contracts
  // public   - INSIDE & OUTSIDE the Contract
  // external - ONLY OUTSIDE the Contract
  // ----------------------------------------------------------------------
  // State variable are stored in the Blockchain
  string private hello = "Hello World - Truffle - Ex-2";
  uint public specialNumber = 21;
  // Returns the Greetings - Hello (A State Variable)
  // View is used to do read-only view of the blockchain data
  function greeting() public view returns (string memory, string memory) {
      string memory hello2 = "Local Hello"; // Local Variable
      return (hello, hello2);
  }
  // External and Pure (Read only) Calls for local variables
  function add(uint x, uint y) external pure returns(uint) {
    return x+y;
  }
  // Global Variables - Part of Blockchain Data - Multiple Return Values
  // 21780 gas
  function returnsMultiple() external view returns (address, uint, uint) {
      address sender = msg.sender;
      uint time = block.timestamp;
      uint number = block.number;
      return (sender, time, number);
  }
  // Multiple Returns with named variable. Explicit return statement is NOT Required
  // 21653 gas - Efficient
  function returnsNamed() public view returns (address _from, uint _time, uint _num) {
      _from = msg.sender;
      _time = block.timestamp;
      _num  = block.number;
  }
  event Log(string func, address sender,  uint value, uint time, uint num, bytes data);
  event Log2(string func, address sender, uint time, uint num, bytes data);
  // Assign Multiple Return Values
  function assignMultipleValues() public  {
      (address from, uint time, uint num) = returnsNamed();
       emit Log2("assignMultipleValues",from,time,num,msg.data);
  }
  // Fallback
  fallback() external payable {
      emit Log("fallback",msg.sender,msg.value,block.timestamp,block.number,msg.data);
  }
  // Receive
  receive() external payable {
      emit Log("receive",msg.sender,msg.value,block.timestamp,block.number,"");
  }
  /**
         Ether is sent to Contract
                    |
            is msg.data is Empty?
                   /  \
                 Yes    No
     receive() exists?   fallback()
            /  \
         Yes    No
    receive()    fallback()
   */
 }