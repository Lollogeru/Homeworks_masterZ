// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.5.0
pragma solidity ^0.8.27;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract HW3_ERC1155 is ERC1155, Ownable {

    string public name = "Game Assets_Inventory";

        uint256 public constant BOW = 1;
        uint256 public constant ARROW = 2;
        uint256 public constant HELMET = 3;
        uint256 public constant APPLE = 4;
        uint256 public constant WATER = 5;

    constructor(address initialOwner) ERC1155("https://gray-imperial-crow-538.mypinata.cloud/ipfs/bafybeiephkfqgkxva5rendouf3ehmprwlwkk3urfktez46b2rxkeg2hu5u/{id}.json") Ownable(initialOwner) {
{ 
        mint(msg.sender, BOW, 1, "");
        mint(msg.sender, ARROW, 1, "");
        mint(msg.sender, HELMET, 1, "");
        mint(msg.sender, APPLE , 50, "");
        mint(msg.sender, WATER , 100, "");
}
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
