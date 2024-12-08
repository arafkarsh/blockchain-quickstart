// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ThirdContract {

    mapping(uint => string) public myMap;

    int[] public numbers;

    string public abc = "";

    function setValue(uint _index, string memory _value) public {
        myMap[_index] = _value;
        abc = "23";

    }

    function getValue(uint _index) public view returns (string memory) {
        return myMap[_index];
    }

    function setNumbers() public {
        numbers.push(1);
        numbers.push(2);
    }

    function setNumbersAgain() public {
        int[] storage numbers2 = numbers;
        numbers2[0] = 20;
    }
}