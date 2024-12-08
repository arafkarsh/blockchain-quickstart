const DefaultValuesConstants = artifacts.require("DefaultValuesConstants");

module.exports = function (deployer) {
  deployer.deploy(DefaultValuesConstants);
};
