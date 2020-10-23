pragma solidity ^0.4.25;

import "./Ownable.sol";

contract ZombieFactory is Ownable {
    
    // Variables
    
    event NewZombie(uint zombieid, string name, uint dna);// Para la creación de un evento

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    //Estructura
    
    struct Zombie {
        string name;
        uint dna;
        uint32 level;
        uint readyTime;
    }
    
    //Array

    Zombie[] public zombies;

    //Creando los mapeos
    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;
    
    //Funcion crear Zombie

    
    function _createZombie(string _name, uint _dna) internal { //se modifica de public a internal
        uint id = zombies.push(Zombie(_name, _dna)) -1; 
    
    //Utilizando el msg.sender
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
  

    }

    /*Generacion de un numero aleatorio a partir de una cadena de texto.
    Los valores deben retornar sin ser modificados; con lo que han de ser de tipo view  
    Keccak256 mapea una cadena de caracteres a un número aleatorio hexagesimal*/ 

    function _generateRandomDna(string _str) private view  returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }
    /*Funcion pública que tomará como parámetro el nombre del Zombi y usará el nombre para
     crear un zombi ccon caracter aletorio*/
     

    function createRamdomZombie(string _name) public {
        //Creando el msg.sender
        require(ownerZombieCount[msg.sender] == 0);
        
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
