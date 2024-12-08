// migrations/2_Owner_deploy.js
const Owner = artifacts.require('Owner');

module.exports = async function (deployer) {
  await deployer.deploy(Owner);
};
