// Attention a bien selectionner le bon reseaux pour recuperer le TX transaction ainsi que sur infura
// la commande pour lancer le test : node "le_nom_du_fichier.js"
//pour installer Web3 : npm install web3

var  Web3  =  require('web3'); 

web3  =  new 

Web3(new  Web3.providers.HttpProvider('https://ropsten.infura.io/v3/ec77c0e136764bf3b62ff5bc9b7dd0fb')); //url rpc infura

var  ethTx  = ('0x2aebb0e45e1a48923cde8f16b1f243780ba7b4c7cbe2c2252029307a667e12c7'); //tx de transaction

web3.eth.getTransaction(ethTx, function(err, result) { 

if (!err  &&  result !==  null) {

    console.log(result); // Log all the transaction info

    console.log('From Address: ' +  result.from); // Log the from address

    console.log('To Address: ' +  result.to); // Log the to address

    console.log('Ether Transacted: ' + (web3.utils.fromWei(result.value, 'ether'))); // Get the value, convert from Wei to Ether and log it

}

else {

    console.log('Error!', err); // Dump errors here

}

});