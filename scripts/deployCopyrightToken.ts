import { ethers } from "hardhat";

async function main() {
    // Copyright Token Contract 
    const copyRightTokenFactory = await ethers.getContractFactory("CopyrightToken");
    const copyRightTokenContract = await copyRightTokenFactory.deploy();
    console.log("CopyRightToken Contract:", copyRightTokenContract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
