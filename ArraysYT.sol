// SPDX-License-Identifier: GPL-3.0
    pragma solidity 0.8.13;
    contract ArraysYT{

        /* 0=> 56
           1=> 114
           2=> 567 
        storage = envoyé de façon persistante dans la blockchain par ce qu'il est declarer a l'exterieur d'une function
        memory = stocker en memoire puis detruit apres utilité et declarer a l'interieur d'une function ATTENTION on doit specifié la longueur du tableau          
        */ 

        uint[] nombre; // tableau en mode Storage graver dans la blockchain imuable
        
        // function d'ajout de valeur au tableau
        function addValue(uint _valeur) public{
            nombre.push(_valeur);
        }

        // function de modification de valeur du tableau
        function updateValue(uint _valeur, uint _index) public{
            nombre[_index] = _valeur;
        }

        //function qui supprime une valeur
        function deleteValue(uint _index) public {
            delete nombre[_index];
        }

        //function qui recupere la valeur d'un index specifique
        function getValue(uint _index) public view returns(uint){
            return nombre[_index];
        }

        //function qui crée un tableau dans une function (qui sera du coup memory) et qui multiplie les valeur du premier tableau par 2
        function getNombreX2() public view returns(uint[] memory){
            uint longueur = nombre.length;
            uint[] memory nombreX2 = new uint[](longueur);
            for(uint i = 0; i < longueur ; i++){
                nombreX2[i] = nombre[i] * 2;
            }
            return nombreX2;
        }

      
        
        function triCroissant() public view returns(uint[] memory){  
            uint taille = nombre.length;
            uint[] memory triCroissant = new uint[](taille);  
            for (uint i = 0; i < taille-2 ; i++)
						{							
							for (uint j = i+1 ; j < taille-1 ; j++)
							{
								if (triCroissant[i] > triCroissant[j])
								{
									uint temp = triCroissant[i];
									triCroissant[i] = triCroissant[j];
									triCroissant[j] = temp;
								}								
							}							
						}
            return triCroissant;
        }

        //transmettre des tableaux en parametre a des function
        //declarer "public" comme ceci ou en "private" ou "internal" 
        function somme(uint[] memory monTablleau) public {

        }
        // meme principe que le precedent, sinon je le declare comme ceci quand la visibilité est en "external"
        function somme2(uint[] calldata monTablleau2) external {

        }
    }