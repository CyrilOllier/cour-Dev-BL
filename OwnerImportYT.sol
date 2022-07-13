// SPDX-License-Identifier: MIT

    /**
    @title ModifierYT
    @author Name    : Cyril OLLIER
    @author Website : http://www.Lab-Net.fr
    @author Contact : admin@lab-net.fr 

    
    @notice FR: Le contrat Modifier explique comment utiliser et fonctionne les modifier dans un contract
    */


   pragma solidity 0.8.13;
 
    contract OwnerImport{

        address owner;

        //Constructor est uniquement appeller a l'aide msg.sender soit le proprietaire du contract donc l'owner
        constructor() {
            owner = msg.sender;
        }

        //seul le propietaire du contract puisse faire ces actions donc seul lui pourra utiliser ce modifier dans ce cas precis
        modifier isOwner() {
            require(msg.sender == owner, "Vous n'etas pas l'administrateur donc vus n'etes pas le proprietaire du contract");
            _;
        }


    }
