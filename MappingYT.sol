// SPDX-License-Identifier: GPL-3.0
    pragma solidity 0.8.13;
    contract MappingYT{

        mapping(address => uint) Balances;

        function getBalance(address _monAdresse) public view returns(uint){
            return Balances[_monAdresse];
            // permet de verifié combien d'ether l'adresse a envoyé sur le contract
        }

        receive() external payable{
           // msg.sender = adresse
           // msg.value = le montant en wei envoyé
           // on va ajouté au mapping(sorte de tableau) du nom de "Balances" des adresses qui corresponde a des uint avec Balances[msg.sender] = msg.value
           //Balances[msg.sender] = msg.value; on ajoute au tableau une adresse a qui correspond le montant envoyé
           Balances[msg.sender] = msg.value;
        }
}