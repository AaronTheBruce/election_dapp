const {assert} = require('chai');

const Election = artifacts.require("./Election.sol");

contract("Election", (accounts) => {
  it("initializes with two candidates", () => {
    return Election.deployed().then(instance => {
      return instance.candidatesCount();
    }).then(count => {
      assert.equal(count, 2)
    })
  })
})
