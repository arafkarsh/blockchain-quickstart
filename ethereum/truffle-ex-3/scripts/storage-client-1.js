// scripts/index.js
module.exports = async function main (callback) {
  try {
    // Retrieve accounts from the local node
    const accounts = await web3.eth.getAccounts();
    console.log(accounts);

    // Call Smart Contract, deployed Storage instance
    const Storage = artifacts.require('Storage');
    const storage = await Storage.deployed();

    // Call the retrieve() function of the deployed Box contract
    const value = await storage.retrieve();
    console.log('Storage value is', value.toString());

    callback(0);
  } catch (error) {
    console.error(error);
    callback(1);
  }
};

