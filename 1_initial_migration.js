const FabricaProfesoresZombies = artifacts.require("FabricaProfesoresZombies");

module.exports = function(deployer) {
  deployer.deploy(FabricaProfesoresZombies);
};
