const Election = artifacts.require("./Election.sol");

contract("Election", (accounts) => {

  let election

  before(async () => {
    election = await Election.deployed(); // get the deployed app
  });

  it("initializes with two candidates", async () => {
    const count = await election.candidatesCount(); // retrieve the count of candidates
    assert.equal(count, 2); // make sure we have only 2
  });

  it("it initializes the candidates with the correct values", async () => {
    const candidate1 = await election.candidates(1);
    const candidate2 = await election.candidates(2);

    assert.equal(candidate1[0], 1, "contains the correct id");
    assert.equal(candidate1[1], "Guy", "contains the correct name");
    assert.equal(candidate1[2], 0, "contains the correct votes count");
    assert.equal(candidate2[0], 2, "contains the correct id");
    assert.equal(candidate2[1], "Buddy", "contains the correct name");
    assert.equal(candidate2[2], 0, "contains the correct votes count");
  });
});
