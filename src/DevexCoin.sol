// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DevexCoin is ERC20 {
    address owner;

    constructor(uint256 _initialValue) ERC20("Devex", "DVX") {
        // mint myself_initvalue token
        _mint(msg.sender, _initialValue);
        owner = msg.sender;
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == owner);
        _mint(to, amount);
    }
}
