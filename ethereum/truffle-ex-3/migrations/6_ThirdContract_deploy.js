// migrations/5_ThirdContract_deploy.js
const ThirdContract = artifacts.require('ThirdContract');

module.exports = async function (deployer) {
  await deployer.deploy(ThirdContract);
};
