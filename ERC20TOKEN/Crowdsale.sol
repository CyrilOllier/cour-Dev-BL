// Crowdsale.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
 
import "./ERC20Token.sol";
 
contract Crowdsale {

/*Supposons que notre token pour cet exemple est le token lab-net.fr. 
Encore un pour la pratique : si je veux émettre "1 LBNT pour chaque euro (EUR) en Ether",  le calcul se fait comme suit :

supposons que 1 ETH == 200€
donc, 10^18 wei = 200€ = 1000000000000000000 wei
par conséquent, 1 EUR est 10^18 / 200 ou 5 * 10^15 wei 
nous avons une décimale de 18, donc nous utiliserons 10 ^ 18 LBNTbits au lieu de 1 LBNT
par conséquent, si un participant envoie au Crowdsale 5 * 10^15 wei il doit recevoir  10 ^ 18 LBNTbits
ce qui donne un taux de 5 * 10^15 wei == 10^18 LBNTbits, ou 1 wei = 200 LBNTbits
donc, le taux à utiliser est 200*/

   uint public rate = 200; // le taux à utiliser
   ERC20Token public token; // L’instance ERC20Token à déployer 
 
   constructor(uint256 initialSupply) {
       token = new ERC20Token(initialSupply); // crée une nouvelle instance du smart contract ERC20Token ! L’instance ERC20Token déployée sera stockée dans la variable “token” 
   }

   receive() external payable {
       require(msg.value >= 0.1 ether, unicode"you can't sent less than 0.1 ether. Vous ne pouvez pas envoyer moins de 0,1 ether"); 
       distribute(msg.value);
       /* require=condition qui permet la reception d'eth avec la condition d'un envoi minimum de 0.1 eth

       utilisation de "unicode"bla,bla texte" " pour prendre en compte les virgules et autres caracteres spéciaux

       la fonction receive permet d'autoriser la réception des investissements.*/
   }

    /*function distribute(uint256 amount) public { 

        /* Pour sécuriser la fonction distribute,
        limiter son utilisation que par le Crowdsale et rendre la distribution des tokens en temps réel, il faut effectuer quelques modifications :

        changer sa visibilité de "public" à "internal"
        l’appeler de la fonction receive, après la vérification du montant envoyé par l’investisseur.*/

   function distribute(uint256 amount) internal {
       uint256 tokensToSent = amount * rate;
       token.transfer(msg.sender, tokensToSent);
        /* la fonction distribute va prendre en paramètre le montant investi,
         va faire le calcul nécessaire en se basant sur le taux de change (ETH/LBNT) et effectue le transfert des tokens en temps réel.

         Pour effectuer le transfert des tokens, nous allons utiliser la fonction "transfer" de l’ERC20 d’OpenZeppelin 
         qui prend en paramètre l’adresse Ethereum de l’investisseur et le montant des tokens à transférer. */

   }
}
