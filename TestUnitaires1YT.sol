// SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

/// @title TestUnitaires.sol
/// @author OLLIER Cyril
/** @notice Ce contract a pour but d'ecrire des test unitaire de la bonne maniere par rapport a un contract.sol 
            ATTENTION !! ce fichier de test et a mettre au format .js dans le dossier test du dossier test de votre projet ce n'est pas un contract 
            il ne faut donc pas le deployer !!!!
            il est unitile de mettre :
            - la license
            - le pragma
            - le titre du contract
            Pour lancer un test dans le terminal en mode console( truffle console)
            aller dans le dossier test de votre projet et lancer :
            test test/LeNomDuContract
            test : signifie que l'on va lancer un test
            test/LeNomDuContract.js correspond au chemin pour pouvoir lancer le bon fihcier pour faire le test
*/
     



contract TestUnitaires {

//ecriture du fichier de test et seulement du fichier de test c'est a dire que l'on par de la premiere ligne du fichier pour ecrire ceux qui suit

//on rappatri le contract sur lequel on va faire les test
const LeNomDucontract = artifacts.require("./LeNomDuContract");
//Artifacts dispose de tous les informations pour interagir avec un contract (changer le C de contract en c )
Contract("LeNomDucontract", account => {
    it("message du test qui ressortiera lors du test", async function(){
        //parce qu'un test fait appel a une funciton asynchronne 
        const Contract = await LeNomDuContract.deployed();
        //La ligne precedente specifie le nom du Contract Deployer
        const result = await Contract.NomDeLaFunctionQueLonVaTester(ValeurDeTest, {from: accounts[0]})
        //La ligne precedente permet de recuperer un resultat a partir d'une fonction du Contract Deployer a partir de l'account 0 de votre ganache
        // si c'est un uint demander mettre un nombre a la place de ValeurDeTest puis pour tester differenment changer VelurDeTest par une chaine de carractere par exemple 
        // le resultat sera que le premier test avec le nombre sera ok et le deuxieme avec des caracteres ne passera pas
        //ce test là fonctionnera pour un SET
    })

    it("message du test qui ressortiera lors du test", async function(){
        //parce qu'un test fait appel a une funciton asynchronne 
        const Contract = await LeNomDuContract.deployed()
        //La ligne precedente specifie le nom du Contract Deployer
        const number = await Contract.NomDeLaFunctionQueLonVaTester()
        //number est en cas uint que l'on attend en rapport a la fonction appeler du contract
        // number je le voi comme une variable que lon crée specifiquement ici pour avoir un resultat a notre test
        //console.log(number);
        assert.equal(number.words[0], ValeurDuTest, "message qui ressortira en cas d'erreur du test");
        //La ligne precedente permet de recuperer un resultat a partir d'une fonction du Contract Deployer
        // si c'est un uint demander mettre un nombre a la place de ValeurDeTest  
        // words est a utiliser dans le cas d'un tableau ou un object pour verifier rajouter la ligne : console.log(number)
        //ce test là fonctionnera pour un GET
})

}