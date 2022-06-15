// SPDX-License-Identifier: GPL-3.0
    pragma solidity 0.8.13;
    contract WalletSimpleYT{

        struct wallet {
            uint balance;
            uint numPayements;
        }

        mapping(address => wallet) Wallets;

        function getTotalBalance() public view returns(uint){
            return address(this).balance;
            //recupere la totalité du montant d'ether effectuer par tous les utilisateurs sur le contract
        }

        //FUNCTION A RESOUDRE //
        
        /*function getTotalNumPayements() public view returns(uint){
            //return address(this).numPayements;
            //return Wallets[msg.sender].numPayements;
            //return Wallets.numPayements[msg.value];
            //return Wallets[msg.value].numPayements;
            //return Wallets.numPayement = numPayements;

            //recupere en nombre de tous les versements effectuer par tous les utilisateurs sur le contract (on compte juste combien de personne on deposé sur le contract
            //ATTENTION cela ne va pas afficher le montant mais bien le nombre de payement effectué
        }*/

        function getBalance() public view returns(uint){
            return Wallets[msg.sender].balance;
            //recupere le montant d'ether envoyer a partir de celui qui appelle la function c'est a dire une seule adresse
        }

        function withdrawAllMoney(address payable _to) public{
            uint _amount = Wallets[msg.sender].balance;
            Wallets[msg.sender].balance = 0;
            _to.transfer(_amount);
            //on recupere tous le montant en ether pour l'envoyer a celui qui utilise la function puis si on refait la manip on previen que la balance est a 0
            //ATTENTION l'utilisation de transfer n'est plus conseillé !!
        }

        receive()external payable {
            Wallets[msg.sender].balance += msg.value;
            Wallets[msg.sender].numPayements += 1;
        }

    }