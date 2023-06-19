// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./interfaces/IERC6551Registry.sol";


contract CopyrightToken is ERC721, Ownable, ReentrancyGuard {

    uint256 public totalSupply;

    address public factoryContract;
    address public implementationContract;
    address public creatorTokenContract;

    constructor() ERC721("CopyrightToken", "CT") {}

    function mint(uint256 creatorId) public onlyCreatorTokenOwner(creatorId) {
        address creatorTokenAddress = getTokenBoundAccountAddress(creatorId, creatorTokenContract);

        _mint(creatorTokenAddress, totalSupply);

        createTokenBoundAccount(totalSupply);

        totalSupply++;
    }

    function _generateTokenBoundAccount(uint256 tokenId) public {
        IERC6551Registry(factoryContract).createAccount(
            implementationContract,
            block.chainid,
            address(this),
            tokenId,
            0,
            ""
        );
    }

    function getTokenBoundAccountAddress(uint256 tokenId, address _contractAddress) public view returns (address) {
        return IERC6551Registry(factoryContract).account(
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
        address _creatorTokenContract
    ) external onlyOwner {
        factoryContract = _factoryContract;
        implementationContract = _implementationContract;
        creatorTokenContract = _creatorTokenContract;
    }

    modifier onlyCreatorTokenOwner(uint256 tokenId) {
        require(
            IERC721(creatorTokenContract).ownerOf(tokenId) == msg.sender,
            "Only the owner of the token can call this function");
        _;
    }

    function isContractAddress(address addr) public view returns (bool) {
        uint size;
        assembly {
            size := extcodesize(addr)
        }
        return size > 0;
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

}
