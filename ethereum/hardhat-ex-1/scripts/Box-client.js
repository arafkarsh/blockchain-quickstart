// scripts/Box-client.js
async function main () {
    // Our code will go here
    console.log("Hardhat Client Testing... ");
    
    // Retrieve accounts from the local node
    console.log("Hardhat Retrieving Accounts from Hardhat Node...");
    const accounts = await ethers.provider.listAccounts();
    console.log(accounts);

    // Make sure to replace the address with the one you got when 
    // deploying the contract. Set up an ethers contract, representing 
    // our deployed Box instance
    // Contract Add: 0x5fbdb2315678afecb367f032d93f642f64180aa3
    const address = '0x5fbdb2315678afecb367f032d93f642f64180aa3';
    const Box = await ethers.getContractFactory('Box');
    const box = await Box.attach(address);

    // Send a transaction to store() a new value in the Box
    await box.store(23);

    // Call the retrieve() function of the deployed Box contract
    const value = await box.retrieve();
    const greet = await box.greeting();
    console.log('HardHat Box value is', value.toString());
    console.log('HardHat Box Greet is', greet.toString());

}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

