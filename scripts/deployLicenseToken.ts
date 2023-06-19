import { ethers } from "hardhat";

async function main() {
    // License Token Contract
    const licenseTokenFactory = await ethers.getContractFactory("LicenseToken");
    const licenseTokenContract = await licenseTokenFactory.deploy();
    console.log("LicenseToken Contract:", licenseTokenContract.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
