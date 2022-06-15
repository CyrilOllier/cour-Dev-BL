// ERC20Token.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

/*abstract contract ERC20Token is ERC20 {*/
contract ERC20Token is ERC20 {

    constructor(uint256 initialSupply) ERC20("ALYRA", "ALY"){
        //_mint(msg.sender, initialSupply); 
        /* msg.sender retourne une “address payable“ qui représente l’expéditeur du message de l’appel en cours.
        
        Cette implémentation est indépendante de la manière dont les jetons sont créés. Ça signifie
        qu'un mécanisme d'approvisionnement doit être ajouté dans un contrat dérivé utilisant {_mint}.
         
         Cette information est à fournir à notre smart contract lors du déploiement, avec _mint la fonction internal de l’ERC20 d’OpenZeppelin 
         qui permet de créer n (amount) tokens à celui qui l’appel (msg.sender). */

    }

}