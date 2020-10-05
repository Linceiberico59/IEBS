pragma solidity ^0.4.25;

contract ZombieFactory {

    // Variables
    
    event NewZombie(uint zombieid, string name, uint dna);// Para la creación de un evento

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    //Estructura
    
    struct Zombie {
        string name;
        uint dna;
    }
    
    //Array

    Zombie[] public zombies;
    
    //Funcion crear Zombie

    
    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) -1;
        emit NewZombie(id, _name, _dna);
    }

    /*Generacion de un numero aleatorio a partir de una cadena de texto.
    Los valores deben retornar sin 
    ser modificados; con lo que han de ser de tipo view  
    Keccak256 mapea una cadena de caracateres a un número aleatorio hexgesimal*/ 

    function _generateRandomDna(string _str) private view  returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }
    /*Funcion pública que tomará como parámetro el nombre del Zombi y usará el nombre para
     crear un zombi ccon caracter aletorio*/
     

    function createRamdomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
