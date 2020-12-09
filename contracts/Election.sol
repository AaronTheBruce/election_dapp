pragma solidity ^0.5.16;

contract Election {

  // Read/Write candidate
  string public candidate;

  // Function Constructor
  constructor () public {
    candidate = "Candidate 1";
  }

}
