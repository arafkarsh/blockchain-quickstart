// migrations/1_Storage_deploy.js
const Storage = artifacts.require('Storage');

module.exports = async function (deployer) {
  await deployer.deploy(Storage);
};
