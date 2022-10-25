// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.0;

// External Interfaces
import {IERC20} from "@oz/token/ERC20/IERC20.sol";

// Internal Interfaces
import {IProposal} from "src/proposal/IProposal.sol";
import {IModule} from "src/modules/base/IModule.sol";

interface IProposalFactory {
    error ProposalFactory__ModuleDataLengthMismatch();

    function target() external view returns (address);
    function moduleFactory() external view returns (address);

    function createProposal(
        address[] calldata funders,
        IModule.Metadata memory authorizerMetadata,
        bytes memory authorizerConfigdata,
        IModule.Metadata memory paymentProcessorMetadata,
        bytes memory paymentProcessorConfigdata,
        IERC20 token,
        IModule.Metadata[] memory moduleMetadatas,
        bytes[] memory moduleConfigdatas
    ) external returns (address);
}