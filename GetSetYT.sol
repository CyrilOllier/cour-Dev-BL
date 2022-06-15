// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.13;
contract GetSetYT{

    //exemple : uint c'est un entier positif uint8 = 0 à 255

    uint nombre; //vairiable d'etat vide = 0
    string maPhrase; // vide par defaut
    address addresse; //par defaut contient que des 0 equivalant a la quantité de carractere a d'une adresse ETH
    bool monBool;
    
    //get et set de uint
    function getNombre() public view returns(uint){
        // get recupere nombre a l'aide du returns dans la declaration de la fonction et return dans le corp de la fonction
        return nombre; //correspond au bouton gris lorsque l'on a deployé le contract (aucun cout en gaz)
    }

    function setNombre(uint _nombre)public {
        // set permet d'attribué un valeur a nombre une foi le contract deployé
        nombre = _nombre; // correspond au bouton jaune pour modifié la valeur de nombre (bouton jaune = coute du gaz)
    }

    //get et set de string
    function getmaPhrase() public view returns(string memory){
        // get recupere nombre a l'aide du returns dans la declaration de la fonction et return dans le corp de la fonction
        return maPhrase; //correspond au bouton gris lorsque l'on a deployé le contract (aucun cout en gaz)
    }

    function setMaPhrase(string memory _maPhrase)public {
        // set permet d'attribué un valeur a nombre une foi le contract deployé
        maPhrase = _maPhrase; // correspond au bouton jaune pour modifié la valeur de nombre (bouton jaune = coute du gaz)
    }

    //get et set de bool
    function getMonBool() public view returns(bool){
        // get recupere nombre a l'aide du returns dans la declaration de la fonction et return dans le corp de la fonction
        return monBool; //correspond au bouton gris lorsque l'on a deployé le contract (aucun cout en gaz)
    }

    function setMonBool(bool _monBool)public {
        // set permet d'attribué un valeur a nombre une foi le contract deployé
        monBool = _monBool; // correspond au bouton jaune pour modifié la valeur de nombre (bouton jaune = coute du gaz)
    }

    //get et set de address
    function getAddresse() public view returns(address){
        // get recupere nombre a l'aide du returns dans la declaration de la fonction et return dans le corp de la fonction
        return addresse; //correspond au bouton gris lorsque l'on a deployé le contract (aucun cout en gaz)
    }

    function setAdresse(address _addresse)public {
        // set permet d'attribué un valeur a nombre une foi le contract deployé
        addresse = _addresse; // correspond au bouton jaune pour modifié la valeur de nombre (bouton jaune = coute du gaz)
    }
}