// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.19;

import {IVirtualCollateralSupply} from
    "src/modules/fundingManager/bondingCurveFundingManager/marketMaker/IVirtualCollateralSupply.sol";

/// @title VirtualCollateralSupplyBase Contract
/// @author Inverter Network
/// @notice This contract manages the virtual collateral supply, providing functionality to set, get
/// add, and subtract the virtual supply.
/// @dev This abstract contract uses internal state variables for the virtual collateral supply and employs
/// various internal and external functions for managing it.
abstract contract VirtualCollateralSupplyBase is IVirtualCollateralSupply {
    //--------------------------------------------------------------------------
    // Storage

    /// @dev The internal state variable to keep track of the virtual collateral supply.
    uint internal virtualCollateralSupply;
    /// @dev Maximum unsigned integer value for overflow checks.
    uint private constant MAX_UINT = type(uint).max; // TODO: The maximum supply has to be divided by the BPS precision used. If not, it can come to overflow errors in downstream contracts

    //--------------------------------------------------------------------------
    // Public Functions
    /// @inheritdoc IVirtualCollateralSupply
    function getVirtualCollateralSupply() external view returns (uint) {
        return _getVirtualCollateralSupply();
    }

    //--------------------------------------------------------------------------
    // Public Functions Implemented in Downstream Contract

    /// @inheritdoc IVirtualCollateralSupply
    function setVirtualCollateralSupply(uint _virtualSupply) external virtual;

    //--------------------------------------------------------------------------
    // Internal Functions

    /// @dev Adds a specified amount to the virtual collateral supply.
    /// Checks for overflow and reverts if an overflow occurs.
    /// @param _amount The amount to add to the virtual collateral supply.
    function _addVirtualCollateralAmount(uint _amount) internal {
        if (_amount > (MAX_UINT - virtualCollateralSupply)) {
            revert VirtualCollateralSupply_AddResultsInOverflow();
        }
        virtualCollateralSupply += _amount;
    }

    /// @dev Subtracts a specified amount from the virtual collateral supply.
    /// Checks for underflow and reverts if an underflow occurs.
    /// @param _amount The amount to subtract from the virtual collateral supply.
    function _subVirtualCollateralAmount(uint _amount) internal {
        if (_amount > virtualCollateralSupply) {
            revert VirtualCollateralSupply__SubtractResultsInUnderflow();
        }

        virtualCollateralSupply -= _amount;
    }

    /// @dev Internal function to directly set the virtual collateral supply to a new value.
    /// @param _virtualSupply The new value to set for the virtual collateral supply.
    function _setVirtualCollateralSupply(uint _virtualSupply) internal {
        virtualCollateralSupply = _virtualSupply;
    }

    /// @dev Internal view function to return the current virtual collateral supply.
    /// @return The current virtual collateral supply as a uint.
    function _getVirtualCollateralSupply() internal view returns (uint) {
        return virtualCollateralSupply;
    }
}