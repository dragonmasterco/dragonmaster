// SPDX-License-Identifier: MIT
pragma solidity =0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract TotemToken is ERC20, ERC20Burnable, AccessControl {
    bytes32 public constant PREDICATE_ROLE = keccak256("PREDICATE_ROLE");

    constructor(address _adminMultiSign, address _predicateProxy) ERC20("TOTEM", "TOTEM") {
        _setupRole(DEFAULT_ADMIN_ROLE, _adminMultiSign);
        _setupRole(PREDICATE_ROLE, _predicateProxy);
    }

    function mint(address to, uint256 amount) external onlyRole(PREDICATE_ROLE) {
        _mint(to, amount);
    }
}