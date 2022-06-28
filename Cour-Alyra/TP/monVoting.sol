// SPDX-License-Identifier: GPL-3.0
        
pragma solidity 0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


    contract Voting is Ownable{

        uint winningProposalId; // id de la proposition gagnante
        
        //dans tous les mapping comme pour cet exemple : address est la clef => bool est la valeur 
        mapping(address=> bool) private _whitelist;
        mapping(address=> bool) private _blacklist;
        //c'est un demande d'evenement en voila que ça m'en fait une belle jambe !!
        event Whitelisted(address _address);
        event Blacklisted(address _address);
 
        function whitelist(address _address) public onlyOwner {
        require(!_whitelist[_address], "This address is already whitelisted !");
        require(!_blacklist[_address], "This address is already blacklisted !");
        _whitelist[_address] = true;
        emit Whitelisted(_address);
        }
 
        function isWhitelisted(address _address) public view onlyOwner returns (bool){
        return _whitelist[_address];
        }

        function blacklist(address _address) public onlyOwner {
        require(!_blacklist[_address], "This address is already blacklisted !");
        require(!_whitelist[_address], "This address is already whitelisted !");
        _blacklist[_address] = true;
        emit Blacklisted(_address);
        }
 
        function isBlacklisted(address _address) public view onlyOwner returns (bool){
        return _blacklist[_address];
        }

        
        struct Voter {
            bool isRegistered; // voter enregistrer = false
            bool hasVoted; // voter a voter = false
            uint votedProposalId; //voter a envoyé la proposition numero id
        }

        struct Proposal {
            string description; // description des propositions
            uint voteCount; // nombre total de vote
        }
        
        enum WorkflowStatus {
            RegisteringVoters, // 0 le voter est dans la liste blanche
            ProposalsRegistrationStarted, // 1 l'admin autorise l'enregistrement des voteurs
            ProposalsRegistrationEnded, // 2 l'admin met fin a l'enregistrement des voteurs
            VotingSessionStarted, // 3 l'admin a ouvert la session des votes
            VotingSessionEnded, // 4 l'admin a mis fin a la session des votes
            VotesTallied // 5 ???? inconue qu'es que ca vien faire là ? serai t'il possible que ce soit le nombre de vote ?? rien a faire là
        }
        WorkflowStatus public workFlowStatus;
    

        Proposal[] proposals; // tableau des propositions 
        Voter[] voters; //tableau des voters
        //mapping(adminChangeStatut => WorkflowStatus) WorkflowStatusChange;

        

        event VoterRegistered(address voterAddress); 
        event WorkflowStatusChange(WorkflowStatus previousStatus, WorkflowStatus newStatus);
        event ProposalRegistered(uint proposalId);
        event Voted (address voter, uint proposalId);

    
        function changeStatutWorkflow(WorkflowStatus _numStatus ) public onlyOwner{
            require (uint(_numStatus) < 5, "ce statut n'existe pas" );
            workFlowStatus = _numStatus;
        }

        function addVoter(bool isRegistered, bool hasVoted, uint voteProposalId) public {
            Voter memory voter = Voter(isRegistered, hasVoted, voteProposalId);
            voters.push(voter);
        }

        function addProposal(string memory description, uint voteCount) public {
            Proposal memory proposal = Proposal( description, voteCount);
            proposals.push(proposal);
        }
    }