const MusiciansMananger = artifacts.require('./MusiciansManager');

contract('MusiciansMananger', accounts => {

    //test pour l'ajout d'un musicien
    it("ajout d'un musicien", async function() 
    {
        //selection du contract deployer
        const Contract = await MusiciansMananger.deployed();
        //on recupere le resultat de la function addMusician pour l'adresse que l'on a decider d'assigné au musicien pour l'exemple
        const result = await Contract.addMusician("0x09238D9eEadc3A8BB6d3672e85d454EC96e9d056", "John", {from: accounts[0]});
        //on verifie que la recuperation correspond bien au nom de l'artiste (John)
        assert.equal(result.logs[0].args._artistName, "John", "Ce n'est pas John");
    })

    // test pour verifier si le musicien existe deja 
    it("Le musicien existe deja !", async function() 
    {
        //selection du contract deployer
        const Contract = await MusiciansMananger.deployed();
        let err = null;
        try 
        {
            //on recupere le resultat de la function addMusician pour l'adresse que l'on a decider d'assigné au musicien pour l'exemple
            await Contract.addMusician("0x09238D9eEadc3A8BB6d3672e85d454EC96e9d056", "John2", {from: accounts[0]});
        }
        catch(error)
        {
            err = error;
        }
        assert.ok(err instanceof Error);
        
    })

    // test pour ajouter une track
    it("ajout d'une track", async function () 
    {
        //selection du contract deployer
        const Contract = await MusiciansMananger.deployed();
        //on recupere le resultat de la function addTrack pour l'adresse que l'on a decider d'assigné au musicien pour l'exemple
        const result = await Contract.addTrack("0x09238D9eEadc3A8BB6d3672e85d454EC96e9d056", "the title of the year", 345, {from: accounts[0]});
        //on verifie que la recuperation correspond bien au titre du morceau 
        assert.equal(result.logs[0].args._title, "the title of the year", "ce titre n'existe pas");        
    })

    //verifiaction si on peu ajouter une track a un artiste qui n'existe pas
    it("non ajout d'une track a un artiste inexsitant", async function() 
    {
        //selection du contract deployer
        const Contract = await MusiciansMananger.deployed();
        let err = null;
        try 
        {
            //on recupere le resultat de la function addTrack pour l'adresse que l'on a decider d'assigné au musicien pour l'exemple
            await Contract.addTrack("0x4B88c95B1c950aCC7A42DE7E379eEbEc6c158A90", "the title is not of the year", 125, {from: accounts[0]});
        }
        catch(error)
        {
            err = error;
        }
        assert.ok(err instanceof Error);

    })

    //recuperation d'une track d'un artist
    it("recuperation d'une track d'un artist", async function () 
    {
        //selection du contract deployer
        const Contract = await MusiciansMananger.deployed();
        //on recupere le resultat de la function getTrack pour l'adresse que l'on a decider d'assigné au musicien pour l'exemple
        const result = await Contract.getTracks("0x09238D9eEadc3A8BB6d3672e85d454EC96e9d056", {from: accounts[0]});
        //on verifie que la recuperation correspond bien a un tableau  
        assert.ok(Array.isArray(result.logs[0].args._tracks));        
    })
})