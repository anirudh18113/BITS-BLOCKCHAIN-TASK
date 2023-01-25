// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract QuestionBank {
    struct Set {
        uint[] values;
        mapping (uint => bool) is_in;
    }
    uint public requiredQuestions;
    uint public totalQuestions;
    constructor (uint _questions, uint _totalQuestions) {
        requiredQuestions = _questions;
        totalQuestions = _totalQuestions;
    }
    Set generated_set;
    uint randNonce = 0;

    function add(uint a) private {
        if (!generated_set.is_in[a]) {
            generated_set.values.push(a);
            generated_set.is_in[a] = true;
        }
    }

    function random(uint _modulus) internal returns(uint){
        randNonce++; 
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender,randNonce))) % _modulus;
    }
    

    function pushQuestions() public {
        while(generated_set.values.length < requiredQuestions){
            uint random_int = random(totalQuestions);
            add(random_int);
        }
    }

    function returnQuestion (uint index) public view returns (uint){
        return generated_set.values[index];
    }
}