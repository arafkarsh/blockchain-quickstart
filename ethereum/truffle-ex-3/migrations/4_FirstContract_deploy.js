// migrations/4_FirstContract_deploy.js
const FirstContract = artifacts.require('FirstContract');

module.exports = async function (deployer) {
  await deployer.deploy(FirstContract);
};
