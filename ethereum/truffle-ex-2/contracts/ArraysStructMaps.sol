// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// Arrays / Structs / Maps
// Array : Dynamic / Fixed in Size
// Insert (push) / get / update / delete / pop / length
// Create Array in Memory
// Return Array from a Function
contract ArraysStructsMaps {
    uint[] private numberArray       = [1,2,3,4,5,6,7];  // Dynamic
    uint[3] private numberArrayFixed = [8,9,10];         // Fixed Size
    // Get Numbers Array Dynamic Size
    function getNumbers() external view returns (uint[] memory) {
        return numberArray;
    }
    // Get Number Array Fixed Size (Return also with Fixed Size)
    function getNumbersFixed() external view returns (uint[3] memory) {
        return numberArrayFixed;
    }
    // Add Element into an Array
    function addNumberArray(uint _val) external {
        numberArray.push(_val);     // Add value into the Array
    }
    // Get Element from Array
    function getNumber(uint _index) external view returns (uint) {
        return numberArray[_index];
    }
    // Delete the Data in the Index Position
    function deleteNumber(uint _index) external {
        delete numberArray[_index];
    }
    function lengthNumberArrauy() external view returns (uint) {
        return numberArray.length;
    }
    function popNumberArrauy() external returns (uint[] memory) {
        numberArray.pop();
        return numberArray;
    }
    // Maps
    // Set / Get / Delete
    mapping(address => uint) private balances;                   // Simple Map
    mapping(address => mapping(address => bool)) public links;  // Nested
    // used to implement Iterable Mapping
    mapping(address => bool) private addressAvailable;                   // Simple Map
    address[] private balanceKeys;
    // Set Balances
    function setBalance(address _addr, uint _bal) external {
        balances[_addr] = _bal;
        // Only used for Iterable Maps
        if(!addressAvailable[_addr]) {
            addressAvailable[_addr] = true;
            balanceKeys.push(_addr);
        }
    }
    // Get the Balance for an Account
    function getBalance(address _addr) external view returns (uint) {
        return balances[_addr];
    }
    // Iterable Maps
    // Get Balance Map Size
    function getSize() external view returns (uint) {
        return balanceKeys.length;
    }
    // First Address Balance
    function first() external view returns (uint) {
        return balances[balanceKeys[0]];
    }
    // Last Address Balance
    function last() external view returns (uint) {
        uint lindex = balanceKeys.length - 1;
        return balances[balanceKeys[lindex]];
    }
    // Get Balance
    function get(uint _index) external view returns (uint) {
        return balances[balanceKeys[_index]];
    }
    // Struct
    struct Car {
        address owner;
        string brand;
        string model;
        uint year;
    }
    Car[] private cars;
    mapping(address => Car[]) public carOwners;
    // Setup Car for the Owner
    function setupCars() external {
        Car memory wrangler = Car(msg.sender, "Jeep", "Wrangler", 2021);
        Car memory scorpio  = Car({ owner: msg.sender, brand: "Mahindra", model: "Scorpio", year: 2008});
        Car memory fortuner;
        fortuner.owner = msg.sender;
        fortuner.brand =  "Toyota";
        fortuner.model =  "Fortuner";
        fortuner.year  =  2012;
        // Add Car to Cars Array
        cars.push(wrangler);
        cars.push(scorpio);
        cars.push(fortuner);
        // Add the Cars to the Owner
        carOwners[msg.sender] = cars;
    }
    // Get the Cars for the Owner
    function getCars(address _addr) external view returns (Car[] memory) {
        return carOwners[_addr];
    }
 }