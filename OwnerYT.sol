// SPDX-License-Identifier: MIT

/*
Copyright : www.Lab-net.fr
Contact : admin@lab-net.fr 
*/


pragma solidity 0.8.13;
 
contract Owner {

    address owner;
    bool pause;
    uint nombre;
    
    constructor() {
        owner = msg.sender;
    }

    // seul l'administrateur peu activer et desactiver cette function qui permet de mettre en pause ou bloqué les manip sur le contract
    function setPause(bool _pause)public {
        require(msg.sender == owner, "Vous n'etes pas l'administrateur du contract !") ;
        pause = _pause;
    }

    // cette fonction est uniquement modifiable par le proprietaire d'ou l'utilisation du "require" qui veut dire "exclusivement requis"
    function setNombre(uint _nombre)public {
        require(!pause, "Le contract est en mode pause.");
        require(msg.sender == owner, "Vous n'etes pas l'administrateur du contract !") ;
        nombre = _nombre;
    }

    // on peu appelle cette fonction est elle estvisible par tous dans certain cas !
    function getNombre() public view returns(uint){
        require(!pause, "Le contract est en mode pause.");
        return nombre;
    }

    // cette function permet de detruire le contract uniquement par l'administrateur et renvoyé les fond contenu vers une adresse de sont choix
    // la fontion est accessible mais ne fonctionnera pas
    // attention il est toujour possible d'envoyer des fonds a l'adresse du contract (es ce un systeme de burn ou brulage de token ??) 
    function destroy(address payable _to) public {        
        require(msg.sender == owner, "Vous n'etes pas l'administrateur du contract !") ;
        selfdestruct(_to);
    }

    
}