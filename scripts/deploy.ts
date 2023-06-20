import { ethers } from "hardhat";

async function main() {

    // Creator Token Contract
    const creatorTokenFactory = await ethers.getContractFactory("CreatorToken");
    const creatorTokenContract = await creatorTokenFactory.deploy();
    await creatorTokenContract.deployed();
    console.log("CreatorToken Contract:", creatorTokenContract.address);

    // Copyright Token Contract 
    const copyRightTokenFactory = await ethers.getContractFactory("CopyrightToken");
    const copyRightTokenContract = await copyRightTokenFactory.deploy();
    console.log("CopyRightToken Contract:", copyRightTokenContract.address);

    // License Token Contract
    const licenseTokenFactory = await ethers.getContractFactory("LicenseToken");
    const licenseTokenContract = await licenseTokenFactory.deploy();
    console.log("LicenseToken Contract:", licenseTokenContract.address);

    // ERC6551 Registry Contract
    const erc6551RegistryFactory = await ethers.getContractFactory("ERC6551Registry");
    const erc6551RegistryContract = await erc6551RegistryFactory.deploy();
    console.log("ERC6551Registry Contract:", erc6551RegistryContract.address);
    
    // Token Bound Account Contract
    const TokenBoundAccountFactory = await ethers.getContractFactory("TokenBoundAccount");
    const entrypoint = "0x5FF137D4b0FDCD49DcA30c7CF57E578a026d2789"
    const tokenBoundAccountContract = await TokenBoundAccountFactory.deploy(entrypoint, erc6551RegistryContract.address);
    console.log("tokenBoundAccount contract deployed at:", tokenBoundAccountContract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
