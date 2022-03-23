import { ethers } from "hardhat";

async function main() {
  const Edu = await ethers.getContractFactory("EduProoft");
  const edu = await Edu.deploy();
  await edu.deployed();

  console.log("EduProof deployed to: ", edu.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
