// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Web3VerseNFT is ERC721 {
    error Web3VerseNFT__TokenUriNotFound();
    mapping(uint256 tokenId => string tokenUri) private tokenIdToUri;
    uint256 private tokenCounter;

    constructor() ERC721("Web3Verseeee", "WWW") {
        tokenCounter = 1;
    }

    function mintNft(string memory tokenUri) public {
        tokenIdToUri[tokenCounter] = tokenUri;
        _safeMint(msg.sender, tokenCounter);
        tokenCounter = tokenCounter + 1;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        if (!_exists(tokenId)) {
            revert Web3VerseNFT__TokenUriNotFound();
        }
        return tokenIdToUri[tokenId];
    }

    function getTokenCounter() public view returns (uint256) {
        return tokenCounter;
    }
}