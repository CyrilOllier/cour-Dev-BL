// SPDX-License-Identifier: MIT

    /**
    @title ModifierYT
    @author Name    : Cyril OLLIER
    @author Website : http://www.Lab-Net.fr
    @author Contact : admin@lab-net.fr 

    
    @notice FR: Le contrat heritage explique comment utiliser et fonctionne les heritage que ce soit dans un meme contract ou grasse a un import externe
    */


    pragma solidity 0.8.13;

import "./OwnerImportYT.sol";

    contract ImportOwner is OwnerImport {

        uint nombre;
        

        //Si il n'y avais pas le isOwner apres le public de la function setNombre il faudrais rajouter la ligne Require du modifier comme dans l'exemple ci-dessous
        // function setNombre(uint _nombre) public {
        //    require(msg.sender == owner, "Vous n'etas pas l'administrateur donc vus n'etes pas le proprietaire du contract");
        //      _;  // Signifier qu'il y a une suite a la function qui dans ce cas precis est :
        //      nombre =_nombre;
        // ceux qui reduit fortement le code taper ainsi que la redondance
        /** Information on peu utiliser plusieurs modifier dans un meme contract */
        function setNombre(uint _nombre) public isOwner {
            nombre = _nombre;
        }

        //Meme chose pour cette function que la precedente que seul l'owner peut utiliser dans l'initialisation de la function on a bien le : isOwner
        function getNombre() public view isOwner returns(uint) {
            return nombre;
        }

    }