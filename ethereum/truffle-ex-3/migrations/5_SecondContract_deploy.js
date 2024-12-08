// migrations/5_SecondContract_deploy.js
const SecondContract = artifacts.require('SecondContract');

module.exports = async function (deployer) {
  await deployer.deploy(SecondContract);
};
