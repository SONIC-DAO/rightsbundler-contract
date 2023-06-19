// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./interfaces/IERC6551Registry.sol";

contract CreatorToken is ERC721, Ownable, ReentrancyGuard {
    uint256 public totalSupply;

    address public factoryContract;
    address public implementationContract;

    constructor() ERC721("CreatorToken", "CT") {}

    function mint() public {
        _mint(msg.sender, totalSupply);
        createTokenBoundAccount(totalSupply);

        totalSupply++;
    }

    function getTokenBoundAccountAddress(
        uint256 tokenId
    ) public view returns (address) {
        return
            IERC6551Registry(factoryContract).account(
                implementationContract,
                block.chainid,
                address(this),
                tokenId,
                0
            );
    }

    function createTokenBoundAccount(uint256 tokenId) internal {
        IERC6551Registry(factoryContract).createAccount(
            implementationContract,
            block.chainid,
            address(this),
            tokenId,
            0,
            bytes("")
        );
    }

    function initContracts(
        address _factoryContract,
        address _implementationContract
    ) external onlyOwner {
        factoryContract = _factoryContract;
        implementationContract = _implementationContract;
    }
}
