// SPDX-License-Identifier: GPL-3.0
    pragma solidity 0.8.13;
    contract CombiStructMappArrayYT{

        struct eleve{
            string nom;
            string prenom;
            uint[] notes;
        }

        /* explication :
            les functions 1 et 2 permettent l'ajout de plusieur note si l'on le desire et d'un nom par rapport a une adresse
            les functions 3 et 4 permettent de lire le tableaux de note d'un elelve ainsiq ue son nom par rapport a son addresse
            pennsé a utilisé la meme adresse pour une seule et même personne (ou eleve) afin que les notes et le nom soit assigné a la même adresse
        */

        mapping(address => eleve) Eleves;

        // 1 ajout une note a une adresse qui correspond ou un elelve
        function addNote(address _eleve, uint _note) public {
            Eleves[_eleve].notes.push(_note);
        }

        // 3 function qui permet de lire les notes cumulé a une adresse
        function getNotes(address _eleve)public view returns(uint[] memory) {
            return Eleves[_eleve].notes;
        }

        // 2 ajout d'un nom a une adresse qui correspond ou un elelve
        function setNom(address _eleve, string memory _nom) public {
            Eleves[_eleve].nom = _nom;
        }

        // 4 function qui permet de lire le nom 
        function getnom(address _eleve) public view returns(string memory){
            return Eleves[_eleve].nom;
        }
    }