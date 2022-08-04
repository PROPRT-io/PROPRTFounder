// SPDX-License-Identifier: MIT
// This is the official PROPRT Founder Card NFT Release. 440 NFTs with Real-World utiility for Real-World Property Investing.
// PROPRT NFTs are created for the purpose of supporting and building the PROPRT.io ecosystem, more details at https://proprt.io

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract PROPRTFounder is ERC1155, ERC2981, Ownable{

    mapping (uint256 => string) private _uris;
    string public name = "PROPRT Founder";
    string public symbol = "PROPRTFounder";

    constructor() ERC1155("https://proprt.mypinata.cloud/ipfs/QmUF9Kvr9wwoCQ21zbMDcjDbRyYKiTEPkZs5UUgyHfq1XA/{i}.json"){
        for (uint i = 0; i<20; i++){
            uint256 PROPRTFounder = i+1;
            _mint(msg.sender, PROPRTFounder, 1, "");
            _setDefaultRoyalty(_msgSender(), 500);
        }
    }

    function uri(uint256 _tokenId) override public view returns (string memory){
        return string(
            abi.encodePacked(
                "https://proprt.mypinata.cloud/ipfs/QmUF9Kvr9wwoCQ21zbMDcjDbRyYKiTEPkZs5UUgyHfq1XA/",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC1155, ERC2981) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
