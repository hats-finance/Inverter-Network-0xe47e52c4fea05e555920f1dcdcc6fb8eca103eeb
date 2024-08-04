# **Inverter Network Audit Competition on Hats.finance** 


## Introduction to Hats.finance


Hats.finance builds autonomous security infrastructure for integration with major DeFi protocols to secure users' assets. 
It aims to be the decentralized choice for Web3 security, offering proactive security mechanisms like decentralized audit competitions and bug bounties. 
The protocol facilitates audit competitions to quickly secure smart contracts by having auditors compete, thereby reducing auditing costs and accelerating submissions. 
This aligns with their mission of fostering a robust, secure, and scalable Web3 ecosystem through decentralized security solutions​.

## About Hats Audit Competition


Hats Audit Competitions offer a unique and decentralized approach to enhancing the security of web3 projects. Leveraging the large collective expertise of hundreds of skilled auditors, these competitions foster a proactive bug hunting environment to fortify projects before their launch. Unlike traditional security assessments, Hats Audit Competitions operate on a time-based and results-driven model, ensuring that only successful auditors are rewarded for their contributions. This pay-for-results ethos not only allocates budgets more efficiently by paying exclusively for identified vulnerabilities but also retains funds if no issues are discovered. With a streamlined evaluation process, Hats prioritizes quality over quantity by rewarding the first submitter of a vulnerability, thus eliminating duplicate efforts and attracting top talent in web3 auditing. The process embodies Hats Finance's commitment to reducing fees, maintaining project control, and promoting high-quality security assessments, setting a new standard for decentralized security in the web3 space​​.

## Inverter Network Overview

Inverter is a modular protocol for Primary Issuance Markets_ enabling maximum value capture from token economies

## Competition Details


- Type: A public audit competition hosted by Inverter Network
- Duration: 2 weeks
- Maximum Reward: $68,131.45
- Submissions: 160
- Total Payout: $68,131.45 distributed among 55 participants.

## Scope of Audit

## Project Overview

Inverter Protocol is designed to provide a flexible and extensible way for any project or protocol to exchange assets between parties programmatically. Its specific focus is on enabling the issuance and distribution of tokens through Primary Issuance Markets (PIMs).

At its core, the Inverter Protocol consists of a modular architecture that seamlessly integrates different modules and existing protocols. This modular approach enables developers to create new modules that can be added to the protocol, allowing for an ever-expanding range of use cases and applications. The aforementioned PIMs employ algorithms to dynamically issue tokens based on real-time data and market conditions tailored to meet specific goals and KPIs relevant to each token's custom use case. 

The Inverter Protocol aims to provide the ground on which to build a diverse range of applications and economies, from tokenization verticals as base-layer blockchains and dApp tokens to community currencies, from IP-NFTs and creative work to real-world assets and cooperatives, from micro-credit insurance pools to tokenized invoice-based SME receivables.

## Documentation & Documents
We created an **onboarding video** for this audit, outlining the architecture, codebase and repository as a great starting point: [Link](https://drive.google.com/file/d/1gQj-O54dTpjT_0tV-MP1vAFu1pUAWfPs/view?usp=drive_link)

**Further Documents**
* Documentation: [Link](https://docs.inverter.network)
* Technical Specification: [Link](https://docs.google.com/document/d/1j6WXBZzyYCOfO36ZYvKkgqrO2UAcy0kW5eJeZousn7E/edit?usp=drive_link)
* Security Guideline: [Link](https://docs.google.com/document/d/1CZgM9OEuibNrimbNeActve5n9ro3Ydu03OfSnZfRo_s/edit?usp=drive_link)

## Audit Competition Considerations
While our protocol is open to be used by anyone with any token, we communicate (in the contracts comments as well as on our UI) that there are certain tokens that will not work properly within our system and will lead to issues. These are:
* Tokens that change their balance without our contracts knowing explicitly (such as Fee on Transfer Tokens or Rebasing Tokens)
* Tokens that are using callback mechanisms, as these could (if abused/malicious) brick a workflow.
As the selection of the specific token is up to the administrator of a workflow, the behavior of these specific tokens is acceptable for us, as we will clearly communicate any risks prior to them creating their workflow.

## Audit Competition Scope

Below is a list of the contracts within the audit's scope. This includes **EVERY** contract within the `src/` folder.

```
src
├── common
│   └── LinkedIdList.sol
├── external
│   ├── fees
│   │   ├── FeeManager_v1.sol
│   │   └── interfaces
│   │       └── IFeeManager_v1.sol
│   ├── forwarder
│   │   └── interfaces
│   │       └── ITransactionForwarder_v1.sol
│   │   └── TransactionForwarder_v1.sol
│   ├── governance
│   │   └── interfaces
│   │       └── IGovernor_v1.sol
│   │   └── Governor_v1.sol
│   └── interfaces
│       └── IERC2771Context.sol
├── factories
│   ├── interfaces
│   │   ├── IModuleFactory_v1.sol
│   │   └── IOrchestratorFactory_v1.sol
│   ├── ModuleFactory_v1.sol
│   └── OrchestratorFactory_v1.sol
├── modules
│   ├── authorizer
│   │   ├── IAuthorizer_v1.sol
│   │   └── extensions
│   │       ├── AUT_EXT_VotingRoles_v1.sol
│   │   └── role
│   │       ├── AUT_Roles_v1.sol
│   │       ├── AUT_TokenGated_Roles_v1.sol
│   │       └── interfaces
│   │           └── IAUT_TokenGated_Roles_v1.sol
│   │           └── IAUT_EXT_VotingRoles_v1.sol
│   ├── base
│   │   ├── IModule_v1.sol
│   │   └── Module_v1.sol
│   ├── fundingManager
│   │   ├── bondingCurve
│   │   │   ├── abstracts
│   │   │   │   ├── BondingCurveBase_v1.sol
│   │   │   │   ├── RedeemingBondingCurveBase_v1.sol
│   │   │   │   ├── VirtualCollateralSupplyBase_v1.sol
│   │   │   │   └── VirtualIssuanceSupplyBase_v1.sol
│   │   │   ├── FM_BC_Bancor_Redeeming_VirtualSupply_v1.sol
│   │   │   ├── FM_BC_Restricted_Bancor_Redeeming_VirtualSupply_v1.sol
│   │   │   ├── FM_BC_Tools.sol
│   │   │   ├── formulas
│   │   │   │   ├── BancorFormula.sol
│   │   │   │   └── Utils.sol
│   │   │   ├── interfaces
│   │   │   │   ├── IBancorFormula.sol
│   │   │   │   ├── IBondingCurveBase_v1.sol
│   │   │   │   ├── IERC20Issuance_v1.sol
│   │   │   │   ├── IFM_BC_Bancor_Redeeming_VirtualSupply_v1.sol
│   │   │   │   ├── IRedeemingBondingCurveBase_v1.sol
│   │   │   │   ├── IVirtualCollateralSupplyBase_v1.sol
│   │   │   │   └── IVirtualIssuanceSupplyBase_v1.sol
│   │   │   └── tokens
│   │   │       └── ERC20Issuance_v1.sol
│   │   ├── IFundingManager_v1.sol
│   │   └── rebasing
│   │       ├── abstracts
│   │       │   ├── ElasticReceiptTokenBase_v1.sol
│   │       │   ├── ElasticReceiptTokenUpgradeable_v1.sol
│   │       │   └── ElasticReceiptToken_v1.sol
│   │       ├── FM_Rebasing_v1.sol
│   │       └── interfaces
│   │           ├── IERC20Metadata.sol
│   │           ├── IERC20.sol
│   │           └── IRebasingERC20.sol
│   ├── lib
│   │   ├── LibMetadata.sol
│   │   └── SafeMath.sol
│   ├── logicModule
│   │   ├── abstracts
│   │   │   ├── ERC20PaymentClientBase_v1.sol
│   │   │   └── oracleIntegrations
│   │   │       └── UMA_OptimisticOracleV3
│   │   │           ├── IOptimisticOracleIntegrator.sol
│   │   │           ├── OptimisticOracleIntegrator.sol
│   │   │           └── optimistic-oracle-v3
│   │   │               ├── AncillaryData.sol
│   │   │               ├── ClaimData.sol
│   │   │               └── interfaces
│   │   │                   ├── OptimisticOracleV3CallbackRecipientInterface.sol
│   │   │                   └── OptimisticOracleV3Interface.sol
│   │   ├── interfaces
│   │   │   ├── IERC20PaymentClientBase_v1.sol
│   │   │   ├── ILM_PC_Bounties_v1.sol
│   │   │   ├── ILM_PC_PaymentRouter_v1.sol
│   │   │   ├── ILM_PC_KPIRewarder_v1.sol
│   │   │   ├── ILM_PC_RecurringPayments_v1.sol
│   │   │   └── ILM_PC_Staking_v1.sol
│   │   ├── LM_PC_Bounties_v1.sol
│   │   ├── LM_PC_PaymentRouter_v1.sol
│   │   ├── LM_PC_KPIRewarder_v1.sol
│   │   ├── LM_PC_RecurringPayments_v1.sol
│   │   └── LM_PC_Staking_v1.sol
│   ├── paymentProcessor
│   │   ├── interfaces
│   │   │   └── IPP_Streaming_v1.sol
│   │   ├── IPaymentProcessor_v1.sol
│   │   ├── PP_Simple_v1.sol
│   │   └── PP_Streaming_v1.sol
├── orchestrator
│   ├── abstracts
│   │   └── ModuleManagerBase_v1.sol
│   ├── interfaces
│   │   ├── IModuleManagerBase_v1.sol
│   │   └── IOrchestrator_v1.sol
│   └── Orchestrator_v1.sol
└── proxies
    ├── interfaces
    │   ├── IInverterBeacon_v1.sol
    │   ├── IInverterProxyAdmin_v1.sol
    │   └── IInverterTransparentUpgradeableProxy_v1.sol
    ├── InverterBeacon_v1.sol
    ├── InverterBeaconProxy_v1.sol
    ├── InverterProxyAdmin_v1.sol
    └── InverterTransparentUpgradeableProxy_v1.sol
```

## Medium severity issues


- **Using `create2` for Module Deployment to Mitigate Reorg-Related Security Risks**

  The protocol's deployment on Polygon, where blockchain reorganizations (reorgs) frequently occur, raises security concerns. Using factories to deploy orchestrators and modules with the `create` opcode based on factory nonce is risky. Reorgs can lead to critical issues, especially since these modules may manage funds, potentially causing users to lose them. The attack scenario involves an adversary front-running the deployment, exploiting the deterministic address creation to intercept transactions and misappropriate funds. To mitigate this vulnerability, it is recommended to use `create2` with `msg.sender` as the salt when deploying new module instances, ensuring unique and secure addresses even during reorgs.


  **Link**: [Issue #18](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/18)


- **Orchestrator Transfers Cause Depositor Losses Due to _bitsPerToken Rebase Failure**

  The orchestrator has the ability to transfer assets from the funding manager, necessitating the rebasement of user balances after each transfer by updating `_bitsPerToken`. This process occurs through the `_rebase` function before every mint or burn. If the supply target is zero, `_rebase` does not update `_bitsPerTokens`, which can lead to a loss for new depositors. For instance, with 1000 active bits and a 500 supply target, the `_bitsPerToken` would be 2. After the orchestrator transfers out 500 assets, leaving the supply target at zero, a new user depositing 1000 assets would receive fewer tokens upon redeeming due to the delayed `_rebase` update, distributing part of their deposit to other users. The issue has been confirmed and requires that the contract maintain at least one token in all scenarios.


  **Link**: [Issue #38](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/38)


- **Vulnerability in FundingManager Allows Unauthorized Transfer of Orchestrator Tokens**

  A significant vulnerability in the `FundingManager` contract poses a risk of massive loss of user or orchestrator funds, allowing an attacker to transfer all orchestrator tokens to themselves. This issue stems from two key weaknesses: first, every module has the same permissions as the orchestrator owner, allowing them to execute transactions using the `executeTxFromModule()` function. Second, the access control for orchestrator functions in the `fundingManager` is improperly set, permitting any module to transfer funds by bypassing the intended access restrictions. The exploit involves calling `executeTxFromModule()` to manipulate the `fundingManager.transferOrchestratorToken()` function. Recommended fixes include using stricter access controls and restricting function permissions.


  **Link**: [Issue #50](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/50)


- **Users Cannot Unstake USDC if Wallet Address is Blacklisted by Token Admin**

  The `LM_PC_Staking_v1.sol` contract enables users to stake their tokens for rewards by using the `stake()` function. However, if users attempt to unstake their tokens using the `unstake()` function while their address has been blacklisted, the transaction will fail. This situation arises specifically with tokens like USDC, which includes a blacklist functionality that can prevent the transfer to blacklisted addresses. As a result, blacklisted users cannot retrieve their staked tokens. The recommended fix is to modify the `unstake()` function to accept a recipient address as a parameter. This allows users to specify a different address for receiving the tokens, circumventing the issue of blacklisted addresses.


  **Link**: [Issue #54](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/54)


- **Governance Beacon Shutdown Incompatibility With Transparent Upgradeable Proxy**

  The protocol utilizes a beacon proxy pattern for efficiently deploying new modules. This involves two proxy implementations: `InverterBeaconProxy_v1` and `InverterTransparentUpgradeableProxy_v1`. The former reads the implementation address dynamically from the beacon during construction, while the latter sets the implementation based on the beacon at the time of construction. A governance-triggered shutdown of a beacon will only impact modules using `InverterBeaconProxy_v1`. This asymmetry poses a potential issue. For example, if a module owner like Bob uses `InverterTransparentUpgradeableProxy_v1` and a vulnerability is found, Bob cannot easily shutdown the compromised module without encountering transaction reverts. A proposed solution involves implementing a version shutdown mapping within the beacon to better handle these shutdown scenarios.


  **Link**: [Issue #55](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/55)


- **Lack of Existence Check on `assertionId` in `assertionResolvedCallback` Facilitates Attacker Exploit**

  The `assertionResolvedCallback` function in the contract lacks a verification check to ensure that the `assertionId` exists. This oversight allows malicious actors to exploit the system by creating their own assertions with the `callbackRecipient` set to the contract's address. They can then manipulate the assertion process, ultimately causing `assertionResolvedCallback` to execute with a non-existing `assertionId`. This does not revert and sets `assertionPending` to false, allowing for the creation of new real assertions. This is problematic when the original assertion gets resolved, leading to potential manipulation of staker rewards. The proposed solution is to add a check to verify the existence of `assertionId` before proceeding with the resolution.


  **Link**: [Issue #65](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/65)


- **Incentives Flow in LM_PC_Staking_v1 Module Creates Potential for Fund Mismanagement**

  The `LM_PC_Staking_v1` module is currently inheriting from `ERC20PaymentClientBase_v1`, treating it like a regular `paymentClient` module, which is problematic for staking scenarios. In this system, user funds are used to incentivize other stakers, functioning as a funding manager. When a contract lacks the necessary funds, it pulls from the `FundingManager`, but there's no guarantee the manager will be properly funded. This creates a vulnerability that could be exploited by creating a high-reward staking contract to attract funds, then failing to return those funds to late stakers. This flaw results from the contract prioritizing stakers' funds for rewards before pulling from the `FundingManager`, causing potential loss of funds or "pyramid" type failures. A proposed solution involves ensuring staked funds are not used to incentivize others by modifying token balance checks. Further complications arise if the reward token is the same as the staking token, leading to locked or lost funds under certain conditions.


  **Link**: [Issue #70](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/70)


- **Blocklisted Address in Dispute Causes DoS in UMA SettleAssertion Function**

  In the `LM_PC_KPIRewarder_v1` contract, an asserter submits KPI data to the UMA oracle, which accepts bonds in currencies like USDC/USDT that have blocklist functionalities. If incorrect information is posted, a malicious disputant can dispute the assertion, providing an arbitrary address for the `disputer`. If the dispute succeeds, this address receives the bond reward, causing a denial-of-service (DoS) issue. This prevents `settleAssertion` from functioning properly, making the `assertionResolvedCallback` unreachable and halting the entire `LM_PC_KPIRewarder_v1` logic. A proposed solution includes a backup mechanism to create new assertions if `assertionPending` remains true, thereby resetting it to false once resolved.


  **Link**: [Issue #75](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/75)


- **Admin Can Bypass Checks for Adding Critical Modules in Orchestrator**

  An admin can circumvent crucial checks intended for adding specific modules to the orchestrator, such as `IFundingManager_v1`, `IAuthorizer_v1`, or `IPaymentProcessor_v1`. The process begins with the admin calling `initiateSetFundingManagerWithTimelock`, which passes required security checks. The admin then cancels the module addition using `cancelFundingManagerUpdate`. Following this, the admin initiates adding a new, potentially malicious module with `initiateAddModuleWithTimelock` and finally executes it with `executeSetFundingManager`. This sequence allows the admin to bypass necessary checks, gaining unintended control over the system. To mitigate, ensure that `cancelFundingManagerUpdate` also cancels any module removal process to maintain security integrity.


  **Link**: [Issue #77](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/77)


- **Admin Can Bypass Security Checks and Timelock Mechanisms**

  The problem stems from the fact that the admin can bypass critical checks and the timelock mechanism, compromising the system's integrity and security. Specifically, `executeSetAuthorizer`, `executeSetFundingManager`, and `executeSetPaymentProcessor` don't verify that the provided address matches the one specified in `initiateSetAuthorizerWithTimelock`, `initiateSetFundingManagerWithTimelock`, and `initiateSetPaymentProcessorWithTimelock`. Two scenarios illustrate how the admin can exploit this vulnerability to avoid necessary checks and execute changes without proper authorization. To mitigate this, it's essential to ensure that the addresses in execution functions match those specified during initiation, thus preserving the intended security measures and user notification protocols.


  **Link**: [Issue #78](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/78)


- **Potential for Exploitation in Bounty Distribution Due to Insufficient Array Length Check**

  In the contract [LM_PC_Bounties_v1](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/blob/09e3a91bdc298a8666f666efbce408178cd83ec8/src/modules/logicModule/LM_PC_Bounties_v1.sol#L45), multiple roles manage bounty payouts to ensure transparency and decentralization. `BOUNTY_ISSUER_ROLE` configures the bounties, `CLAIMANT_ROLE` sets the contributors, and `VERIFIER_ROLE` triggers the payments. The issue arises when the verifier's `contributors` array length is not checked against `_claimRegistry[claimId].contributors`. Without this check, a claimant could update the contributors list just before the verifier calls `verifyClaim` with an old array, resulting in unintended payments. This vulnerability allows claimants to add extra contributors and potentially redirect funds falsely. It is recommended to incorporate a length check in `contributorsNotChanged` to prevent such exploitation.


  **Link**: [Issue #82](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/82)


- **DoS Vulnerability in Payment Processor Allowing Malicious ActivePaymentReceivers Array Growth**

  `PP_Streaming_v1` is a payment processor that distributes funds via streams over time, requiring users to claim their payments. It uses `activePaymentReceivers` to track recipients, which are added through the `_addPayment` function. However, there's no limit to the size of the `activePaymentReceivers[client]` array, which poses a risk. A malicious user could exploit this by creating many bogus streams, leading to an excessively large array. This can cause the gas costs for operations like `claimRewards`, `stake`, and `unstake` to exceed block limits, effectively bricking the functionality of `LM_PC_Staking_v1` and freezing user funds. The issue can be addressed by either limiting the array size or introducing admin functions to target and remove specific streams.


  **Link**: [Issue #85](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/85)


- **Raw Calls in PP_Simple_v1.sol and PP_Streaming_v1.sol May Cause Phishing Risks**

  **PP_Simple_v1.sol** and **PP_Streaming_v1.sol** have raw calls to a token contract at specific lines. These calls might mistakenly be considered successful transfers if the `token_` address is not a contract, as a `call` to a non-contract address returns `true`.

This can lead to two main problems:

1. Phishing risks due to the incorrect execution flow and the emission of `TokensReleased` events. This can result in notifications about token payments that never occurred, especially with token addresses that are not yet deployed.
2. The modular architecture implies hidden checks for token contracts, potentially causing issues when integrating new modules.

A suggested fix is to use the **SafeERC20** library from OpenZeppelin. 

Additionally, a check on `paymentOrder` creation is planned to mitigate these issues.


  **Link**: [Issue #118](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/118)


- **Vulnerability in FM_Rebasing_v1 Allows Value Extraction Through Front-Running Deposits**

  The module [FM_Rebasing_v1](https://github.com/InverterNetwork/audit-hats/blob/09e3a91bdc298a8666f666efbce408178cd83ec8/src/modules/fundingManager/rebasing/FM_Rebasing_v1.sol) is susceptible to JIT (just in time liquidity) exploitation. Users can manipulate deposit and withdrawal timings around increases in "bits" value to gain an unfair share of rewards. Specifically, deposits can be front-run to capitalize on value increases, and back-run withdrawals can maximize profits, enabling users to exploit the system without any associated risk. An illustrative attack scenario involves a user monitoring profit injections into the vault, making significant deposits just before value increases, and promptly withdrawing to extract a disproportionate share of the rewards. Implementing a withdrawal window is recommended to deter such manipulative behavior.


  **Link**: [Issue #128](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/128)


- **MEV Attack Possible When Reducing Reserve Ratio for Selling in Bonding Curve**

  The `FM_BC_Bancor_Redeeming_VirtualSupply_v1.setReserveRatioForSelling` function is vulnerable to a manipulation exploit where an attacker can front-run transactions if they detect that the reserve ratio for selling is about to be reduced. The attacker can use a flash loan to buy a large amount of tokens before the reduction transaction executes, then immediately sell them afterward, gaining an unfair profit. A Proof of Concept (PoC) file demonstrates a scenario where an attacker can exploit this vulnerability, resulting in significant profit from a series of orchestrated transactions. The concern revolves around the potential for a miner extractable value (MEV) attack, which adversely affects protocol users. After reviewing, it was deemed that disclosure and mitigation are important as similar issues have been noted in other contexts.


  **Link**: [Issue #131](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/131)


- **Risk-Free Sandwich Attack on BondingCurve FundingManager Through Virtual Supply Changes**

  The problem lies within the `FundingManager` of a `BondingCurve`, where the balance does not accurately reflect its virtual `collateral` and `issuance` supply. When these values are altered through `setVirtualCollateralSupply()` or `setVirtualIssuanceSupply()` without organic transactions, it opens up a risk-free sandwich attack opportunity. An attacker can front-run a virtual collateral increase with a minimal buy order and then back-run with a sell order, almost emptying the `FundingManager`. This exploit could result in a substantial loss, as demonstrated by a scenario involving `BNB` tokens. The issue is exacerbated by the potential for extreme virtual supply changes, making it highly abusable despite being designed for experimentation.


  **Link**: [Issue #155](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/155)

## Low severity issues


- **Missing `_disableInitializers()` Call in OrchestratorFactory_v1 and ModuleFactory Constructors**

  `OrchestratorFactory_v1.sol` and `ModuleFactory.sol` lack the `_disableInitializers()` call in their constructors. This omission allows attackers to take over the implementation contracts by calling the `init` function, potentially causing unexpected behavior, especially with `delegatecalls`. It is recommended to lock the contracts using `_disableInitializers` as per OpenZeppelin's guidelines.


  **Link**: [Issue #8](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/8)


- **Failed Token Transfers Not Properly Handled in RedeemingBondingCurveBase_v1.sol**

  Transfers are not adequately handled, as non-ERC20 compliant tokens may return false instead of reverting. The calling contract wouldn't notice the failure if it doesn't check the return value. The recommendation is to use `safeTransfer` instead of `transfer` to ensure proper handling of transfer failures.


  **Link**: [Issue #10](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/10)


- **Missing validation for start and end timestamps in PaymentOrder struct**

  In the `PaymentClientBase`, the `PaymentOrder` struct is not adequately validated. While recipient, token, and amount are checked, the `start` and `end` timestamps are not. It’s recommended to include a check ensuring `end` is greater than or equal to `start` to prevent potential issues with timestamp validation.


  **Link**: [Issue #16](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/16)


- **Use ECDSA.recover Instead of ecrecover to Prevent Signature Malleability**

  Using EVM's `ecrecover` for signature recovery is prone to malleability issues. This problem can be mitigated by replacing `ecrecover` with the more secure `ECDSA.recover` from the OpenZeppelin library, which includes additional validations for `v` and `s` values to ensure signature uniqueness and integrity.


  **Link**: [Issue #17](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/17)


- **Fee Bypass Vulnerability in BondingCurveFundingManagerBase Through Repeated Small Transactions**

  An orchestrator owner can set a 2% fee for the `BondingCurveFundingManagerBase`. However, this fee can be bypassed if someone buys tokens in small increments (e.g., 49 units). This loophole allows the exploiter to avoid paying fees, especially on low-activity L2 chains. A potential fix is to implement a `minBuyAmount` state variable.


  **Link**: [Issue #22](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/22)


- **Missing Event Emission in castVote Function Reduces Contract Transparency**

  The function `AUT_EXT_VotingRoles_v1.sol::castVote` lacks event emission, which is crucial for ensuring transparency and informing users about voting activities. Without this, tracking important changes becomes difficult. Adding event emission will provide users with a clear record of vote casting, enhancing contract transparency. Manual analysis confirms the need for this improvement.


  **Link**: [Issue #27](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/27)


- **Time Validation Check Incorrectly Implemented in Payment Processor Module**

  The time validation check in `PP_Streaming_v1.sol::validTimes` is incorrectly implemented. It uses the `&&` operator instead of `||`, causing invalid times to be treated as valid. This error could lead to the protocol being in an unexpected state. Replacing `&&` with `||` is recommended to resolve this issue.


  **Link**: [Issue #53](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/53)


- **Denial of Service Risk in Module Management Functions Due to Timelock**

  The functions `initiateSetFundingManagerWithTimelock`, `initiateSetAuthorizerWithTimelock`, and `initiateSetPaymentProcessorWithTimelock` add and remove modules without changing the overall module count. If the module limit is at maximum, these functions will fail, requiring the owner to remove a module first, causing delays due to an additional timelock period. It is suggested to exclude the `moduleLimitNotExceeded` check for these functions to avoid this issue.


  **Link**: [Issue #56](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/56)


- **Update `moduleLimitNotExceeded` to Account for Pending Module Additions**

  The `moduleLimitNotExceeded` function only checks existing modules, ignoring pending additions. This could allow owners to call `initiateAddModuleWithTimelock` repeatedly, potentially exceeding the module limit. Updating the function to account for both existing and pending modules would prevent surpassing the allowed number of modules.


  **Link**: [Issue #57](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/57)


- **Duplicate Module Titles in Orchestrator Lead to Incorrect Module Addresses**

  Adding a new module to the orchestrator does not account for existing modules with the same title, causing potential duplicates. This leads to incorrect values returned by the `_isModuleUsedInOrchestrator` function, which can result in unintended module execution and security vulnerabilities. A check for duplicate titles should be implemented to mitigate this issue.


  **Link**: [Issue #58](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/58)


- **Rounding Errors in Price Calculation Due to Decimal Mismatch in Bonding Curve**

  The `getStaticPriceForBuying()` and `getStaticPriceForSelling()` functions in the Funding Manager's bonding curve use a formula that is prone to rounding errors due to differences in decimal places between collateral and issuance tokens. This can cause prices to round down to zero. Possible solutions include normalizing supplies to the same decimal space or adjusting the precision parameters.


  **Link**: [Issue #59](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/59)


- **Natspec Mismatch Allows Team Multisig Unauthorized Access to Contract Ownership**

  `Governor_v1.acceptOwnership()` currently allows both the community and team multisig addresses to accept contract ownership, contrary to the Natspec documentation which states only the community multisig should have this access. To resolve this, restrict the function to the `COMMUNITY_MULTISIG_ROLE` address only.


  **Link**: [Issue #60](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/60)


- **Incorrect function selector in `_getFunctionFeesAndTreasuryAddresses` affects `_buyOrder` operation**

  `BondingCurveBase_v1` uses `_getFunctionFeesAndTreasuryAddresses` to obtain fee percentages from `FeeManager_v1`, but it calls this function with an incorrect selector. The incorrect selector leads to the wrong fee being returned, potentially causing `_buyOrder` to function improperly, returning the default collateral fee instead of the correct workflow fee.


  **Link**: [Issue #61](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/61)


- **`assertDataFor function incorrectly assigns bond payment to msgSender instead of asserter`**

  `postAssertion` incorrectly assumes that the `asserter` address pays for the bond, but the actual bond is always paid by `msgSender()`. This discrepancy renders the `asserter` parameter ineffective and makes it impossible for the module itself to pay for the bond. Proposed fix includes reworking `assertDataFor` to transfer the bond from the `asserter` instead of `msgSender()`.


  **Link**: [Issue #64](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/64)


- **Voting Role Manager Vulnerable to Malicious Takeover Due to No Minimum Threshold**

  The `AUT_EXT_VotingRoles_v1` module in the `Orchestrator_v1` system lacks an enforced minimum threshold, allowing any voter to remove others if set to zero or one. This can lead to a complete takeover by a single voter. It's recommended to enforce a minimum threshold of two voters to prevent misuse.


  **Link**: [Issue #67](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/67)


- **Missing Interface IDs in `supportsInterface` Method for `OptimisticOracleIntegrator`**

  The protocol uses ERC165 to check interface support, implemented in `Module_v1`, but it lacks support for critical interfaces in `OptimisticOracleIntegrator`. This could significantly affect external integrations. It’s suggested to override `supportsInterface` and add necessary interface IDs for better functionality.


  **Link**: [Issue #74](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/74)


- **Issues in Upgradeable Contracts Due to Missing Storage Gaps and Incorrect Imports**

  For upgradeable contracts, a storage gap is essential to allow adding new state variables without compromising storage compatibility. In some Inverter contracts, storage gaps are missing, potentially leading to storage collisions and critical misbehavior. It's recommended to use upgradeable OpenZeppelin contracts and add necessary storage gaps to fix this issue.


  **Link**: [Issue #84](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/84)


- **Missing Validation for Privileged Modules in initiateAddModuleWithTimelock() Function**

  The `initiateAddModuleWithTimelock()` function is designed to add new logic modules but doesn't verify if the module is privileged. This oversight allows privileged modules to be added without removing the old ones, which deviates from expected behavior. It's recommended to check if the module supports privileged interfaces and revert if it does.


  **Link**: [Issue #86](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/86)


- **"Event Emission Issue with Indexed Dynamic Arrays in Solidity Contract"**

  When the `indexed` keyword is used for dynamic arrays or strings, it returns their hash rather than their actual value. This affects the `ClaimAdded` event in the `LM_PC_Bounties_v1` contract, causing the front-end to receive meaningless hashes instead of expected data, potentially leading to data loss. To resolve this, remove the `indexed` keyword from the dynamic array parameters in events.


  **Link**: [Issue #91](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/91)


- **Tokens meant for withdrawal as fees being transferred inadvertently**

  Funding managers use `transferOrchestratorToken` to move funds but lack checks for `projectCollateralFeeCollected`. This oversight can misallocate designated fee tokens and impact withdrawal operations, leading to a protocol's loss of accumulated fees. Adjustments recommended to incorporate checks for `projectCollateralFeeCollected` to prevent misallocation and potential issues.


  **Link**: [Issue #101](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/101)


- **Incompatibility of ElasticReceiptTokenBase_v1 with ERC2771 Meta Transactions**

  The protocol relies on ERC2771 for meta transactions, where a user signs a transaction, and another executes it. However, `ElasticReceiptTokenBase_v1` uses `msg.sender` instead of `_msgSender`, making it incompatible with ERC2771. The recommended fix involves altering inheritance to make `ElasticReceiptTokenBase_v1` compatible.


  **Link**: [Issue #104](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/104)


- **New Module Versions Do Not Replace Older Versions, Risking Compatibility Issues**

  When new major versions of modules are added, previous versions are not deleted. This allows new users to access outdated versions, potentially causing compatibility issues and security vulnerabilities. The recommended solution is to delete old versions whenever a new major version is introduced.


  **Link**: [Issue #108](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/108)


- **Avoid redundant call to `_earned` in `_distributeRewards` to save gas**

  The `_distributeRewards` function contains an unnecessary call to `_earned` since `_update` already performs this action prior to `_distributeRewards`. The line `uint amount = _earned(recipient, rewardValue)` can be replaced with `rewards[recipient]` to save gas. Tests confirm this change is valid.


  **Link**: [Issue #112](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/112)


- **Voter Misdirection Vulnerability Due to Polygon Blockchain Reorganization**

  In a scenario involving voting motions, a blockchain reorganization on Polygon could cause a misalignment in motion IDs, leading to voters inadvertently supporting the wrong motion. If the order of transactions changes due to the reorg, a motion submission could be replaced, and voters might end up voting on a different, potentially malicious, motion. A proposed solution is to calculate motion IDs using a hash of the target, action, and motion count to prevent misdirection.


  **Link**: [Issue #117](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/117)


- **Reentrancy Issue in claimPreviouslyUnclaimable Function Locks Funds Temporarily**

  The `claimPreviouslyUnclaimable` function in the `PP_Streaming_v1` contract has a reentrancy issue. It first transfers tokens to the receiver and then calls `amountPaid` on the client, allowing users to reenter the contract before `_outstandingTokenAmounts` is reduced. This can cause temporary fund locking. Mitigation involves ensuring state changes occur before external calls, similar to the approach used in `PP_Simple_v1`.


  **Link**: [Issue #119](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/119)


- **Rewards Rounding Down to Zero Can Cause Denial of Service**

  In `LM_PC_KPIRewarder_v1.sol::assertionResolvedCallback`, the line `rewardAmount += achievedReward * (trancheRewardValue / trancheEnd);` can cause rewards to be rounded down to zero if `trancheRewardValue` is less than `trancheEnd`. This results in lost rewards and a function revert due to the `validAmount` modifier. Removing the curly braces could prevent precision loss.


  **Link**: [Issue #120](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/120)


- **Staking Functions Vulnerable to Malicious Overflow Attack Using cUSDCv3**

  The `stake` function in both `LM_PC_Staking_v1` and `LM_PC_KPIRewarder_v1` contracts can be exploited by passing `type(uint256).max` as the amount, causing an overflow. This allows a malicious user to block further stakes and potentially lock up reward tokens, making withdrawal impossible and resulting in a total loss for the contract owner.


  **Link**: [Issue #126](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/126)


- **Incorrect Dev Comment Regarding the Maximum _depositAmount in Bancor Formula**

  The developer comment inaccurately describes the maximum deposit amount allowed, stating it is limited to \(10^{20}\). However, testing revealed that the actual maximum deposit value is significantly larger at \(100{,}000{,}000{,}000{,}000{,}000e18\). The discrepancy in this comment could lead to misunderstandings regarding transaction limits.


  **Link**: [Issue #132](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/132)


- **Nonce exploit in EIP2771 multicall allows transaction manipulation and denial.**

  A vulnerability in the EIP2771 protocol's custom multicall implementation allows malicious parties to manipulate nonces and perform front-running attacks. This can lead to transaction reversion and nonce consumption, disrupting legitimate transactions. One proposed solution is to ensure `executeBatch` reverts if any internal call fails.


  **Link**: [Issue #133](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/133)


- **Modify `stake` function to allow existing users to add smaller amounts**

  The `stake` function's `minimumStake` check prevents users already in the `stakingQueue` from adding smaller amounts. The suggested modification is to apply the `minimumStake` check only for new users, allowing existing users to stake additional smaller amounts without restriction.


  **Link**: [Issue #136](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/136)


- **Introduce Deadline Parameter in Contract Functions to Prevent Fund Loss**

  Several functions in a contract lack deadline checks, posing a risk for users. Without these checks, transactions can be delayed, potentially causing financial loss due to outdated slippage parameters or MEV exploitation. Introducing a deadline parameter in functions like `buyFor` and `sellFor` is recommended to ensure timely execution.


  **Link**: [Issue #137](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/137)


- **Inaccurate Event Emission in OptimisticOracleIntegrator Affects Transaction Outcome Interpretation**

  The `OptimisticOracleIntegrator::assertionResolvedCallback(...)` function improperly emits the `DataAssertionResolved(...)` event regardless of the assertion's truthfulness. According to UMA documentation, this event should only be emitted if the assertion is true. This inaccuracy can lead to misinterpretation of transaction outcomes, impacting audits, monitoring, and system reporting accuracy. Proposed code changes include emitting the event only when the assertion is true.


  **Link**: [Issue #148](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/148)


- **Users may lose value when BancorFormula returns zero due to rounding issues**

  Users may lose value when using `BancorFormula` if it returns zero during `buy` or `sell` operations. This zero return can occur when there's a significant disparity between `issuance` and `collateral` token supplies. Adding checks in the relevant functions to verify non-zero mint and redeem amounts is recommended to prevent this issue.


  **Link**: [Issue #157](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/157)


- **Some Solidity Files Use Unspecific Compiler Versions in Pragma Definitions**

  Some Solidity files in the codebase have unspecific compiler versions in their pragma definitions, which can be a security risk. Specific files affected include LinkedIdList.sol, AUT_TokenGated_Roles_v1.sol, LibMetadata.sol, AncillaryData.sol, and ClaimData.sol. It is recommended to avoid floating pragmas and pin a specific compiler version (`0.8.23`).


  **Link**: [Issue #158](https://github.com/hats-finance/Inverter-Network-0xe47e52c4fea05e555920f1dcdcc6fb8eca103eeb/issues/158)



## Conclusion

The audit report details a comprehensive security assessment of the Inverter Network Protocol conducted through a Hats.finance decentralized audit competition. Over two weeks, 160 submissions were made, resulting in a total payout of $68,131.45 distributed among 55 participants. The audit identified several medium and low-severity security issues within the protocol's modular framework, primary issuance markets, and token economy integrations.

Medium severity issues include vulnerabilities related to module deployment using `create2`, orchestrator transfers, unauthorized token transfers in the funding manager, blacklisted USDC addresses causing unstaking failures, beacon proxy and storage gaps, lack of existence checks on `assertionId` facilitating system manipulation, mismanagement in staking incentives, potential denial of service (DoS) risks, and mechanisms for front-running and manipulation exploiting virtual supply changes and bonding curve mechanisms.

Low severity issues address concerns such as missing initializer calls, incorrect handling of token transfers, unvalidated timestamps, the potential for fee bypass, lack of event emissions, improper time checks, risk of DoS due to timelock mechanisms, potential duplicate module titles, rounding errors, incorrect Natspec comments, nonce exploit scenarios, reentrancy vulnerabilities, and inaccurate event emissions.

The audit underscores the importance of robust security mechanisms and the effectiveness of decentralized audit competitions in identifying and remedying vulnerabilities to strengthen the protocol’s resilience and reliability.

## Disclaimer


This report does not assert that the audited contracts are completely secure. Continuous review and comprehensive testing are advised before deploying critical smart contracts.


The Inverter Network audit competition illustrates the collaborative effort in identifying and rectifying potential vulnerabilities, enhancing the overall security and functionality of the platform.


Hats.finance does not provide any guarantee or warranty regarding the security of this project. Smart contract software should be used at the sole risk and responsibility of users.

