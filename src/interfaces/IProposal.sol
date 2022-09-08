// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity ^0.8.0;

import {IAuthorizer} from "src/interfaces/IAuthorizer.sol";
import {IModuleManager} from "src/interfaces/IModuleManager.sol";

interface IProposal is IModuleManager {
    function authorizer() external view returns (IAuthorizer);
}
