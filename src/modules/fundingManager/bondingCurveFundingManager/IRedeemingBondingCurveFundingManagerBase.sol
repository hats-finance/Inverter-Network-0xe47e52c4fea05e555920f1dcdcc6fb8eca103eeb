// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity 0.8.19;

interface IRedeemingBondingCurveFundingManagerBase {
    //--------------------------------------------------------------------------
    // Errors

    /// @notice Function is only callable if selling is not already enabled.
    error RedeemingBondingCurveFundingManager__SellingAlreadyOpen(); // bugfix @review oversight?

    /// @notice Function is only callable if selling is not already closed.
    error RedeemingBondingCurveFundingManager__SellingAlreadyClosed(); // bugfix @review oversight?

    /// @notice Percentage amount is bigger than 100%, i.e. 10_000
    error RedeemingBondingCurveFundingManager__InvalidFeePercentage();

    /// @notice Deposit amount has to be larger than zero
    error RedeemingBondingCurveFundingManager__InvalidDepositAmount();

    /// @notice Selling functionalities are set to closed
    error RedeemingBondingCurveFundingManager__SellingFunctionaltiesClosed();

    /// @notice Not enough collateral in contract for redemption
    error RedeemingBondingCurveFundingManager__InsufficientCollateralForRedemption(
    );

    //--------------------------------------------------------------------------
    // Events

    // TODO: Contract still needs events. Where are events needed?

    //--------------------------------------------------------------------------
    // Functions

    /// @notice Redeem tokens on behalf of a specified receiver address.
    /// @dev Redirects to the internal function `_sellOrder` by passing the receiver address and deposit amount.
    /// @param _receiver The address that will receive the redeemed tokens.
    /// @param _depositAmount The amount of issued token to deposited.
    function sellOrderFor(address _receiver, uint _depositAmount)
        external
        payable;

    /// @notice Sell collateral for the sender's address.
    /// @dev Redirects to the internal function `_sellOrder` by passing the sender's address and deposit amount.
    /// @param _depositAmount The amount of issued token depoisited.
    function sellOrder(uint _depositAmount) external payable;

    /// @notice Opens the selling functionality for the collateral.
    /// @dev Only callable by the Orchestrator owner, or Manager.
    ///      Reverts if selling is already open.
    function openSell() external;

    /// @notice Closes the selling functionality for the collateral.
    /// @dev Only callable by the Orchestrator owner, or Manager.
    ///      Reverts if selling is already closed.
    function closeSell() external;

    /// @notice Sets the fee percentage for selling collateral, payed in collateral
    /// @dev Only callable by the Orchestrator owner, or Manager.
    ///      The fee cannot exceed 10000 basis points. Reverts if an invalid fee is provided.
    /// @param _fee The fee in basis points.
    function setSellFee(uint _fee) external;
}