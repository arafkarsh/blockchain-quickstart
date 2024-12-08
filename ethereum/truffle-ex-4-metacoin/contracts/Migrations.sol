// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;

contract Migrations {
  address public owner;
  uint public last_completed_migration;
  string public myStr = "Hello";

  modifier restricted() {
    if (msg.sender == owner) _;
  }

  constructor() {
    owner = msg.sender;
  }

  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }
}
