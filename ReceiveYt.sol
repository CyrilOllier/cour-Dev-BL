// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.13;
contract ReceiveYT{

    //pour tester le contract le deployé a partir d'un adresse, selectionné une autre adresse saisir le montant et clic sur transact et verifier a l'aide des 2 getters
    //le montant envoyer et l'emeteur de l'envoi, on peu change d'adresse pour recommencer l'action
    
    address lastPerson; //symbolise la derniere personne qui a envoyé de l'argent
    uint balance; //montant total d'argent envoyé sur le contract

    function getLastPerson() public view returns(address){
        return lastPerson;
    }

    function getBalance() public view returns(uint){
        return balance;
    }

    receive() external payable {
        //receive() external payable correspond a une ecoute extereieure de la par du contract et payable=recevoir de l'ether
        lastPerson = msg.sender; //msg.sender correspond a l'adresse de la personne qui a envoyer de l'argent sur le contract
        balance = balance + msg.value; //msg.value coorespond au montant en wei que l'utilisateur a envoyer sur le contract

    }
}