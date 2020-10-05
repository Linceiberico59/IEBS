pragma solidity ^0.4.25;

contract FabricaProfesoresZombies {

    //Variables

    event NewZombie(uint zombieid, string name, uint dna);
    
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    
    //Estructura

    struct Zombies {
        string name;
        string Materia;
        uint dna;
    }
    //Array->Recordar que Array se debe llamar igual que la estructura struct
    
    Zombies[] public ProfesoresZombies;

    /*Función Nuevos Profesores->
    El nombre de la función es discrecional pero push debe llamarse igual que el Array y el Struct;
    Para el nuevo Zombie, debe de tener el mismo número de parametros que el struct; en este caso,3 */

    function  NewProfesorZombie(string _name, string _Materia, uint _dna) public {
        uint id = ProfesoresZombies.push(Zombies(_name, _Materia, _dna)) -1;
        emit NewZombie(id, _name, _dna);
    }
    /*Generacion de un numero aleatorio a partir de una cadena de texto.
     Los valores deben retornar sin modificación con lo que han de ser de tipo view
     Keccak256 mapea una cadena de caracateres a un número aleatorio hexagesimal*/ 
    
    function _generateRamdonDna(string _str) public view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }
    /*Funcion pública que tomará como parámetro el nombre del ProfesorZombi y lo usará para
     crear un _NewProfesorZombi con caracter aletorio. A la 2ª línea le pasamos los parámetros
     _name _Materia y _ randDna*/
    
    function ProfesorZombie(string _name, string _Materia) public {
        uint randDna = _generateRamdonDna(_name);
        NewProfesorZombie(_name, _Materia, randDna);
    }

}
