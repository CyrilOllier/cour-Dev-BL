// SPDX-License-Identifier: MIT

    /**
    @title ModifierYT
    @author Name    : Cyril OLLIER
    @author Website : http://www.Lab-Net.fr
    @author Contact : admin@lab-net.fr 

    
    @notice FR: Le contrat Modifier explique comment utiliser et fonctionne les modifier dans un contract
    */


    pragma solidity 0.8.13;
 
    contract IfElseForWhile {

        uint nombre;
        uint nombre2 = 10;
        bool isPaused;
        
        //dans cette function tous les nombres differents de 5 passeront mais si on entre 5 en valeur la transaction fera un revert ou annule la transaction
        function setNombre(uint _nombre) public {
            if(_nombre ==5) {
                revert('cela nest pas possible REVERT Activer !');
            }
            else {
                nombre = _nombre;
            }
        }

        //si pause est a true on le met a false et inverssement si il est true on le met a false
        function pauseContract() public {
           if(isPaused) { //revien a dire qu'il est egale a (isPaused == true)
           isPaused = false;
           }
           else {
               isPaused = true;
           }
        }

        function compter() public view {
            string memory test2 = "vous etes a 2";
            string memory test8 = "vous etes a 8";
            for(uint i = 0 ; i < nombre2 ; i++) {
               if(i == 2) {
                   test2; //sachant que ici il ne pourra jamais y aller le break ce fera avant
               }
               if(i == 8) {
                    test8;
               }
               else {
                   if (i == 5) {
                       break;
                   }
               }
            }

        }

        function compter2() public {
            
            while(!isPaused) {
                    isPaused = true;
                
            }

        }

    }