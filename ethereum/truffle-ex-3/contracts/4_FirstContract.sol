// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract FirstContract {
    string private greetings = "Hello World";

    uint256 private age;

    string public myGreetings = "Hello My World";

    function setAge(uint _age) public {
        age = _age;        
    }  

    function getGreetings() public view returns(string memory) {
        return greetings;
    }

    uint private balanceRecieved;

    function depositMoney() public payable {
        balanceRecieved += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawMoneyTo(address payable _to, uint _amt) public {
        if(this.getBalance() > _amt) {
            _to.transfer(_amt);
        }
    }

}