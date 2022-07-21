// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import './OwnerImportYT.sol';

/// @title GestionAppartementYT.sol
/// @author OLLIER Cyril
/** @notice Ce contract a pour but de nous refaire travailler un peu l'ecriture de contract intelligent avec pour but la gestion d'appartement 
sur 2 contract dont 1 importer qui s'utilisera avec ce Contract GestionAppartement
*/


     
contract GestionAppartement is OwnerImport
{
    enum typeBien
    {
        terrain,
        appartement, 
        maison
    }

    struct bien 
    {
        uint id;
        uint price;
        string name;
        typeBien _typeBiens;
    }

    uint compteur;
    mapping(address =>bien[]) Possessions;

    function addBien(address _proprietaire, uint _price, string memory _name, typeBien _typeBien) public isOwner
    {
        require(_price > 1000, "Le bien doit couter plus de 1000 wei");
        require(uint(_typeBien) >= 0, "Le type de bien doit etre compris entre 0 et 2");
        require(uint(_typeBien) <= 2, "Le type de bien doit etre compris entre 0 et 2");
        Possessions[_proprietaire].push(bien(compteur,_price, _name, _typeBien));
        compteur++;
    }

    function getBiens(address _proprietaire) public view isOwner returns(bien[] memory)
    {
        return Possessions[_proprietaire];
    }

    function getNombreBiens(address _proprietaire) public view isOwner returns(uint)
    {
        return Possessions[_proprietaire].length;
    }

    function getMesbiens() public view returns(bien[] memory)
    {
        return Possessions[msg.sender];        
    }
}