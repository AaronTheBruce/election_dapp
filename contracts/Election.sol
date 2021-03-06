pragma solidity ^0.5.16;

contract Election {

  // Candidate Model
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  /*
    Read write Candidates
    A mapping in Solidity is like an associative array or a hash, that associates key-value pairs.
    We can create this mapping like this:
    (Cannot iterate, uninitialized candidates will possess a default empty Candidate) Need a counter cache!
  */
  //      key       value    visibility
  mapping(uint => Candidate) public candidates;
  mapping(address => bool) public voters;

  /* Store the total Number of Candidates */
  uint public candidatesCount;

  // Helper method for adding a new Candidate
  function addCandidate(string memory _name) private {
    candidatesCount++;  // increase the number of total candidates by 1
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);  // using the new number as an id, assign to the candidates map a new candidate using the contructor
  }

  function vote(uint _candidateId) public {
    // require that they haven't voted before
    require(!voters[msg.sender]);

    // require a valid candidate
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    // record that voter has voted
    voters[msg.sender] = true;

    // add a vote to the chosen candidate
    candidates[_candidateId].voteCount++;

  }

  // Constructor
  constructor () public {
    addCandidate("Guy");
    addCandidate("Buddy");
  }

}
