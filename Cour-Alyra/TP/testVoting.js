const {BN, expectRevert, expectEvent } = require("./Voting.sol");
const {expect } = require('chai');
const constants = require('@openzeppelin/test-helpers/src/constants');

contract ("Voting", accounts => {
    
    const owner = accounts[0];
    const voter = accounts[1];
    const voter2 = accounts[2];
    let vontingInstance;

    describe("verification si l'utilisateur est en liste blanche ou noire", function() {

        beforeEach(async function (){
            votingInstance = await voting.new({from:owner})
        })

        it("should voter is whiteListed", async () => {
            await votingInstance.addVoter(voter, {from:owner});
            const storedata = await votingInstance.getVoter(voter, {from:voter})
            console.log(storedata.isRegistred);
            expect(storedata.isRegistred).to.equal(true);
        });

        it("should voter is not whiteListed", async () => {
            await votingInstance.addVoter(voter, {from:owner});
            const storedata = await votingInstance.getVoter(voter2, {from:voter})
            console.log(storedata.isRegistred);
            expect(storedata.isRegistred).to.equal(true);
        });
    });
    
    describe("test du vote", function() {

        beforeEach(async function (){
            votingInstance = await voting.new({from:owner})
        })

        it("should voter as voted", async () => {
            await votingInstance.addVoter(voter, {from:owner});
            const storedata = await votingInstance.getVoter(voter, {from:voter})
            console.log(storedata.isRegistred);
            expect(storedata.isRegistred).to.equal(true);
        });

        it("should voter as not voted", async () => {
            await votingInstance.addVoter(voter, {from:owner});
            const storedata = await votingInstance.getVoter(voter2, {from:voter})
            console.log(storedata.isRegistred);
            expect(storedata.isRegistred).to.equal(true);
        });

        
    });


    
});