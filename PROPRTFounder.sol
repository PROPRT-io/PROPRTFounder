// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/common/ERC2981.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract PROPRTFounder is ERC2981, ERC1155, Ownable{

    mapping (uint256 => string) private _uris;
    string public name = "PROPRT Founder";
    string public symbol = "PROPRTFounder";

    constructor() ERC1155("https://bafybeif6gsqjhcnaypxtjoh43tcjca2kxrqxb6paxi4gjoevuasjmka5py.ipfs.nftstorage.link/{i}.json"){
        for (uint i = 0; i<20; i++){
            uint256 PROPRTFounder = i+1;
            _mint(msg.sender, PROPRTFounder, 1, "");
        }
    }

    function uri(uint256 _tokenId) override public view returns (string memory){
        return string(
            abi.encodePacked(
                "https://bafybeif6gsqjhcnaypxtjoh43tcjca2kxrqxb6paxi4gjoevuasjmka5py.ipfs.nftstorage.link/",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    }

    
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC2981, ERC1155) returns (bool) {
        return super.supportsInterface(interfaceId);
    }

    function royaltyInfo(
        uint256 _tokenId,
        uint256 _value
    ) external view returns (
        address _receiver,
        uint256 _royaltyAmount
    );
}
