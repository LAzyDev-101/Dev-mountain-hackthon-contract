
import { expect } from "chai";
import { ethers } from "hardhat";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";

describe("EudProof Test", function() {
  let eduProof: any;
  let owner: SignerWithAddress;
  let addr1: SignerWithAddress;
  let addr2: SignerWithAddress;
  let addrs: SignerWithAddress[];

  beforeEach(async function() {
    const EduProof = await ethers.getContractFactory("EduProof");
    eduProof = await EduProof.deploy();
    await eduProof.deployed();

    [owner, addr1, addr2, ...addrs] = await ethers.getSigners();

  });

  it("", async function() {

  });

});

