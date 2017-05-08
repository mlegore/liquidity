pragma solidity ^0.4.0;

/// @title Voting with delegation.
contract BinaryOracle {

    mapping(bool => address) votes; 
    address[] voters;

    bool public value;
    uint public lastUpdated;

    /// Create a new oracle.
    function BinaryOracle() {
        
    }  

    /// Give your vote (including votes delegated to you)
    /// to proposal `proposals[proposal].name`.
    function vote(bool value) {
        votes[msg.sender] = value;

        if(voters.length == 101)
        {            
            int trueCount = 0;
            if(votes[voters[i]])
            {
                trueCount++;
            }
            value = trueCount > 50;

            int reward = this.balance / 101;
            for(uint i = 0; i < 101; i++)
            {
                voters[i].send(reward);
            }            
        }        
    }

    /// @dev Computes the winning proposal taking all
    /// previous votes into account.
    function winningProposal() constant
            returns (uint winningProposal)
    {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal = p;
            }
        }
    }



    function currentValue() constant
        returns (uint value)
    {
        
    }
}