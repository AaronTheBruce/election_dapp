pragma solidity ^0.4.2;

contract Election {

  // Read/Write candidate
  string public candidate;

  // Function Constructor
  function Election () public {
    candidate = "Candidate 1";
  }


}
