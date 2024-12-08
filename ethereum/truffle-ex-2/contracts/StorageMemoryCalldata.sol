// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Data Locations 
// Storage  = Data is a state variable (Stored in Blockchain)
// Memory   = Data is loaded into Memory
// Calldata = Data is loaded into Memory and used ONLY as function input
//            Data cant be changed when location is Calldata
contract StorageMemoryCalldata {
    // Structure
    struct KatStruct {
        uint varInt;
        string varText;
        bool varStatus;
    }
    // Store Structure based on (Caller) Sender Address
    mapping(address => KatStruct) public myKats;

    // Set Structure into the Map
    function storeStructure() external {
        myKats[msg.sender] = KatStruct({varInt: 21, varText: "kat", varStatus: true});

        KatStruct storage myKat = myKats[msg.sender];
        myKat.varText = "Hawk";

        KatStruct memory readOnlyKat = myKats[msg.sender];
        readOnlyKat.varInt = 30;
    }
    // Change the Text in the KatStruct
    // 34850 gas
    function changeNameIM(string memory _text) external {
        KatStruct storage myKat = myKats[msg.sender];
        myKat.varText = _text;
    }
     // Change the Value in the KatStruct
     // 34270 gas - Calldata is less expensive compared to Memory
    function changeNameCD(string calldata _text) external {
        KatStruct storage myKat = myKats[msg.sender];
        myKat.varText = _text;
    }
    // Array Size will be fixed with Memory Location
    function changeValue(uint[] memory _vals) external returns (uint[] memory) {
        KatStruct storage myKat = myKats[msg.sender];
        myKat.varInt = _vals[0];
        // Location = Memory then Array Size MUST be fixed
        uint[] memory memArray = new uint[](3);
        memArray[0] = myKat.varInt;
        return memArray;
    }
}