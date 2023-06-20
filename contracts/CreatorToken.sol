// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "./interfaces/IERC6551Registry.sol";

contract CreatorToken is ERC721, Ownable, ReentrancyGuard {
    uint256 public totalSupply;

    address public factoryContract;
    address public implementationContract;

    constructor() ERC721("CreatorToken", "CT") {}

    struct Creator {
        address creatorAddress;
        string name;
        string description;
        string website;
        string profilePicture;
    }

    mapping (uint256 => Creator) public creators;

    function mint(
        address _creatorAddress,
        string memory _name,
        string memory _description,
        string memory _website,
        string memory _profilePicture
    ) public {
        _mint(msg.sender, totalSupply);
        createTokenBoundAccount(totalSupply);

        creators[totalSupply] = Creator(
            _creatorAddress,
            _name,
            _description,
            _website,
            _profilePicture
        );

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

    function tokenURI(uint256 tokenId) public view override returns (string memory) {        
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        string memory image = creators[tokenId].profilePicture;

        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(
                    bytes(
                        abi.encodePacked(
                            '{"name":"',
                            creators[tokenId].name,
                            '", "description":"',
                            creators[tokenId].description,
                            '", "external_url":"',
                            creators[tokenId].website,
                            '", "image":"',
                            image,
                            '"}'
                        )
                    )
                ))
        );
    }
}
