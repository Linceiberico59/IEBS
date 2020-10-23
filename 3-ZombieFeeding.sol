pragma solidity ^0.4.25;

import "./ZombieFactory.sol";

contract ZombieFeeding is ZombieFactory {

    //storage & memory
    function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    require(msg.sender == zombieToOwner[_zombieId]);
    Zombie storage myZombie = zombies[_zombieId];

    _targetDna = _targetDna % dnaModulus;
    uint newDna = (myZombie.dna + myZombie.dna) /2;
    _createZombie("Noname", newDna);


    }
}