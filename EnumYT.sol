// SPDX-License-Identifier: GPL-3.0
    pragma solidity 0.8.13;
    contract EnumYT{

        //enum etape (un produit peu etre commande, expedie, ou livre
       enum etape {commande, expedie, livre} // meme principe que les tableau on commence a 0 et ce


       struct produit{
           uint _SKU; // produit a identifiant unique
           EnumYT.etape _etape; // chaque produit a une etape (commande, expedie, livre)
       }

        //corelation mapping avec un produit
       mapping(address => produit) CommandesClient; 

       //function commander initialise la structure "produit memory p" p etant la variable dans la function de la structure produit
       // et on creer une nouvelle structure en fonction des information des arguments de la function 
       function commander(address _client, uint _SKU) public {
           produit memory p = produit(_SKU, etape.commande);
           CommandesClient[_client] = p; // attribution de au mapping la structure de l'eptape commander
       }

        //function qui determine qu'un produit est a l'etape "expedie"
       function expedier(address _client) public {
           CommandesClient[_client]._etape = etape.expedie;           
       }

        //function qui permet de recuperer le SKU d'un client
       function getSKU(address _client) public view returns(uint) {
           return CommandesClient[_client]._SKU;
       }

        //function qui permet de recupere l'etape ou en est le produit
       function getEtape(address _client) public view returns(etape) {
           return CommandesClient[_client]._etape;
       }
    }