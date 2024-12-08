// scripts/index.js
module.exports = async function main (callback) {
  try {
    // Retrieve accounts from the local node
    const accounts = await web3.eth.getAccounts();
    console.log(accounts);

    // Call Smart Contract, deployed FirstContract instance
    const FirstContract = artifacts.require('FirstContract');
    const firstContract = await FirstContract.deployed();

    // Send a transaction to store() a new value in the FirstContract
    await firstContract.setAge(23);
    await firstContract.depositMoney();

    // Call the functions of the deployed FirstContract
    const balance = await firstContract.getBalance();
    const greet = await firstContract.getGreetings();
    console.log('firstContract Balance is', balance.toString());
    console.log('firstContract Greetings ', greet.toString());

    callback(0);
  } catch (error) {
    console.error(error);
    callback(1);
  }
};

