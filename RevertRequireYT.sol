// SPDX-License-Identifier: GPL-3.0
        
pragma solidity 0.8.13;

contract RevertRequireYT {
    //echanger les parties en commentaire pour passé de l'une des façon a l'autre et inverssement
    uint nombre;

    function setNombre(uint _nombre) public {
       // ancienne maniere de faire
       /* if(_nombre == 10){
            revert('le nombre ne peut pas etre egal a 10'); // revert arrete la function et rend le gaz restant et n'irra jamais a l'etape suivante c'est a dire "nombre = _nombre;"
       */
       //fin premiere parti anciene maniere

       // nouvelle maniere de faire
          require(_nombre != 10, "le nombre ne peut pas etre egal a 10"); // require rend le gaz cela veut dire exclusivement "Requis" sinon s'arrete aussi et permet d'optimisé le code a defaut le l'ancienne façon avec le "revert"
          nombre = _nombre;
        //fin nouvelle maniere de faire

        // suite ancienne maniere
        /*}       
        nombre = _nombre; 
        */
    }

    function getNombre() public view returns(uint) {
        return nombre;
    }
}
