// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract SecondContract {

    address owner;
    bool public paused;
    string public checkMessage = "Initial Message";

    constructor() {              
          owner = msg.sender;
    }

    function setMsg(string memory _msg) public {
        checkMessage = _msg;
    }

    function setPaused(bool _paused) public {
        require(msg.sender == owner, "You are NOT the owner");
        paused = _paused;
    }

    uint public balanceRecieved;

    function depositMoney() public payable {
        balanceRecieved += msg.value;
    }


    function withdrawMoney(address payable _to) public {
        require(msg.sender == owner, "You dont have rights as You are Not the Owner.");
        require(!paused, "Contract is Paused");
        _to.transfer(address(this).balance);
    }

    function destroySmartContract(address payable _to) public {
        require(msg.sender == owner, "You are NOT the owner");
        selfdestruct(_to);
    }

}