pragma solidity ^0.4.0;

/// @title True or False Oracle.
contract BinaryOracle {

    struct Vote { bool value; bool explicit; }
    mapping(address => Vote) votes;
    address[] voters;

    string public target;
    bool public value;    
    uint public lastUpdated;

    /**@dev Calculates a rectangle's surface and perimeter.
     * @param _target the target value that voters try to provide.
     * @return value The value of target as determined by Schelling Point.
     */
    function BinaryOracle(string _target) {
        target = _target;
    }  

    /// Give your vote on the possible value of the target.
    function vote(bool value) {
        votes[msg.sender].value = value;
        if(!votes[msg.sender].explicit) {
            uint next = voters.length++;
            voters[next] = msg.sender;
            votes[msg.sender].explicit = true;
        }

        if(voters.length == 101) {            
            uint trueCount = 0;
            lastUpdated = now;

            for(uint i = 0; i < voters.length; i++) {
                if(votes[voters[i]].value) {
                    trueCount++;
                }
            }
           
            value = trueCount > 50;
            uint reward;

            // Determine the reward by splitting the balance between the correct voters.
            if(value) {
                reward = this.balance / trueCount;
            } else {
                reward = this.balance / (101 - trueCount);
            }
            
            for(uint j = 0; j < 101;j++) {
                // If the voter's response was correct, reward them.
                if(value == votes[voters[i]].value) {
                    voters[i].transfer(reward);
                }
            }            
        }        
    }
}