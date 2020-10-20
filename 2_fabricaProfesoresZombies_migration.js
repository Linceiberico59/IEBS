let FabricaProfesoresZombies = artifacts.require("./FabricaProfesoresZombies.sol");

module.exports = function(deployer) {
    deployer.deploy(FabricaProfesoresZombies);
}