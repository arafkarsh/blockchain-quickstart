const FunctionModifier = artifacts.require("FunctionModifier");

module.exports = function (deployer) {
  deployer.deploy(FunctionModifier);
};
