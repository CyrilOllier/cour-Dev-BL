// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract MusiciansManager {

  event musicianCreated(string _artistName);
  event trackAdded(string _artistName, string _title);
  event getTheTracks(Track[] _tracks);

  struct Track
  {
    string title;
    uint duration;
  }
  
  struct Musician
  {
    string _artistName;
    Track[] _tracks;
  }

  mapping(address => Musician) Musicians;

  address owner;

  constructor(){
    owner = msg.sender;
  }

  modifier onlyOwner() 
  {
    require(msg.sender == owner, "vous n'etes pas l'administrateur du contract");
    _;
  }

  // verification si le musicien existe deja ou pas par son addresse
  //on ajoute byte sinon .lenght ne fonctionnera pas
  function addMusician(address _musicianAddress, string memory _artistName) external onlyOwner 
  {
    require(bytes(Musicians[_musicianAddress]._artistName).length == 0, "Le musicien existe deja dans notre base");
    //ligne qui ajoute le musicien au mapping pour de le crée si il n'existe pas
    Musicians[_musicianAddress]._artistName = _artistName;
    emit musicianCreated(_artistName);
  }

  function addTrack(address _musicianAddress, string memory _title, uint _duration) external onlyOwner 
  {
    require(bytes(Musicians[_musicianAddress]._artistName).length > 0, "Ce musicien n'existe pas dans la base");
    Track memory thisTrack = Track(_title,_duration);
    Musicians[_musicianAddress]._tracks.push(thisTrack);  
      //aller sur le mapping Musicians recuperer (id avec _musicianAddress) ainsi que la recuperation de son nom et le titre du morceau
    emit trackAdded(Musicians[_musicianAddress]._artistName, _title);
  }

  function getTracks(address _musicianAddress) external 
  {
    // l'emit va aller recuperer toutes les track d'un musicien en particulier
    emit getTheTracks(Musicians[_musicianAddress]._tracks);
  }

}
