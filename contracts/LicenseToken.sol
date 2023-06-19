// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./interfaces/IERC6551Registry.sol";

contract LicenseToken is ERC721, Ownable, ReentrancyGuard {
    uint256 public totalSupply;

    address public factoryContract;
    address public implementationContract;
    address public copyrightTokenContract;
    address public creatorTokenContract;

    constructor() ERC721("LicenseToken", "CT") {}

    function mint(
        uint256 creatorId,
        uint256 copyrightId
    ) public onlyCreatorTokenOwner(creatorId) onlyCopyrightOwner(creatorId, copyrightId) {

        address copyrightTokenAccount = getTokenBoundAccountAddress(
            copyrightId,
            copyrightTokenContract
        );

        _mint(copyrightTokenAccount, totalSupply);        

        totalSupply++;
    }

    function getTokenBoundAccountAddress(
        uint256 tokenId,
        address _contractAddress
    ) public view returns (address) {
        return
            IERC6551Registry(factoryContract).account(
                implementationContract,
                block.chainid,
                _contractAddress,
                tokenId,
                0
            );
    }

    function initContracts(
        address _factoryContract,
        address _implementationContract,
        address _creatorTokenContract,
        address _copyrightTokenContract
    ) external onlyOwner {
        factoryContract = _factoryContract;
        implementationContract = _implementationContract;
        creatorTokenContract = _creatorTokenContract;
        copyrightTokenContract =  _copyrightTokenContract;
    }

    modifier onlyCopyrightOwner(uint256 creatorId, uint256 tokenId) {
        require(
            IERC721(copyrightTokenContract).ownerOf(tokenId) == getTokenBoundAccountAddress(
                creatorId,
                creatorTokenContract
            ),
            "Only the owner of the token can call this function"
        );
        _;
    }

    modifier onlyCreatorTokenOwner(uint256 tokenId) {
        require(
            IERC721(creatorTokenContract).ownerOf(tokenId) == msg.sender,
            "Only the owner of the token can call this function"
        );
        _;
    }

}
