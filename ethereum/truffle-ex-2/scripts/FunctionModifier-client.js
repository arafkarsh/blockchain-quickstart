// scripts/FunctionModifier-client.js
module.exports = async function main (callback) {
  try {
    // Retrieve accounts from the local node
    const accounts = await web3.eth.getAccounts();
    // console.log(accounts);

    // Call Smart Contract, deployed FunctionModifier instance
    const FunctionModifier = artifacts.require('FunctionModifier');
    const functionModifier = await FunctionModifier.deployed();

    const value0 = await functionModifier.getCounter();
    console.log('counter       = ', value0.toString());

    await functionModifier.start();

    // Call the Smart Contract for FunctionModifier
    await functionModifier.increment();
    const value1 = await functionModifier.getCounter();
    console.log('counter.inc() = ', value1.toString());

    await functionModifier.stop();
    console.log('counter.stop()  ');
    try {
      await functionModifier.increment();
    } catch (error) {
      console.log("Increment failed!!!");
    }
    const value2 = await functionModifier.getCounter();
    console.log('counter.inc() = ', value2.toString());

    await functionModifier.start();
    console.log('counter.start()  ');
    await functionModifier.increment();
    const value3 = await functionModifier.getCounter();
    console.log('counter.inc() = ', value3.toString());

    await functionModifier.kat();
    const value4 = await functionModifier.getCounter();
    console.log('counter.kat() = ', value4.toString());

    callback(0);
  } catch (error) {
    console.error(error);
    callback(1);
  }
};

