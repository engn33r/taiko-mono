// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

/// @notice Verifier interface for RISC Zero receipts of execution.
/// https://github.com/risc0/risc0-ethereum/blob/release-1.0/contracts/src/IRiscZeroVerifier.sol
interface IRiscZeroReceiptVerifier {
    /// @notice Verify that the given seal is a valid RISC Zero proof of execution with the
    /// given image ID and journal digest. Reverts on failure.
    /// @dev This method additionally ensures that the input hash is all-zeros (i.e. no
    /// committed input), the exit code is (Halted, 0), and there are no assumptions (i.e. the
    /// receipt is unconditional).
    /// @param seal The encoded cryptographic proof (i.e. SNARK).
    /// @param imageId The identifier for the guest program.
    /// @param journalDigest The SHA-256 digest of the journal bytes.
    function verify(bytes calldata seal, bytes32 imageId, bytes32 journalDigest) external view;
}
