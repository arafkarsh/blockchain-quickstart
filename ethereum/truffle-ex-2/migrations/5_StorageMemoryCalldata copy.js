const StorageMemoryCalldata = artifacts.require("StorageMemoryCalldata");

module.exports = function (deployer) {
  deployer.deploy(StorageMemoryCalldata);
};
