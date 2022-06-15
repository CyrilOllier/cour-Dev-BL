// SPDX-License-Identifier: GPL-3.0
    pragma solidity 0.8.13;
    contract StructYT{

        //struct et un equivalent a un Objet
        struct balance {
            uint money; // correspond a l'argentde l'utilisateur a sur le contract
            uint numPayements; // nombre de payements
        }

        // on fait correlé la structure "balance" dans le mapping "Balances"
        mapping(address => balance) Balances; 

        function getBalance() public view returns(uint) {
                return Balances[msg.sender].money;
                //on interoge le mapping Balances avec msg.sender (celui qui utilise la function) pour y retourner le resultat de l'argent envoyer sur le contract
        }

        function getNumPayements() public view returns(uint) {
                return Balances[msg.sender].numPayements;
                //on interoge le mapping Balances avec msg.sender (celui qui utilise la function) pour y retourner le nombre de payement fait sur le contract
        }

        receive() external payable {

           Balances[msg.sender].money += msg.value; 
           Balances[msg.sender].numPayements += 1;
           //on rajoute "+=" avec le "msg.sender" (l'adresse de l'emeteur) le montant d'argent (money) et (msg.value) pour la valeur envoyé au contract
           //on rajoute "+=" avec le "msg.sender" (c'est a dire l'adresse de l'emeteur) un payement au contract avec "numPayements" (incrementation des payements de l'utilisateur)
           // toutes ces infos sont envoyé dans le mapping Balances
        }
    }