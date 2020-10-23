pragma solidity ^0.4.19;

import "./ZombieFeeding.sol";

contract ZombieHelper is ZombieFeeding {

    modifier aboveLevel(uint _level, uint _zombieId) {
        //Comprobación de que zombies[_zombieId].level >= _level
        require(zombies[_zombieId].level >= _level);
        _;
    }
}