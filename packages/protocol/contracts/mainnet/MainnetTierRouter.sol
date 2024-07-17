// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "../L1/tiers/ITierRouter.sol";

/// @title MainnetTierRouter
/// @dev Labeled in AddressResolver as "tier_router"
/// @custom:security-contact security@taiko.xyz
contract MainnetTierRouter is ITierRouter {
    uint256 public constant ONTAKE_FORK_HEIGHT = 367_200; // = 7200 * 52

    /// @inheritdoc ITierRouter
    function getProvider(uint256 _blockId) external pure returns (address) {
        if (_blockId <= ONTAKE_FORK_HEIGHT) {
            return 0x4cffe56C947E26D07C14020499776DB3e9AE3a23; // TierProviderV2
        } else {
            revert("not implemented");
        }
    }
}
