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



## Conclusion

The audit report details a public audit competition hosted by Inverter Network through Hats.finance, a platform known for its decentralized security infrastructure supporting major DeFi protocols. Hats.finance’s unique audit competition approach involves leveraging a collective of skilled auditors to proactively identify vulnerabilities in smart contracts, ensuring efficient allocation of budgets by rewarding only uncovered issues. For this competition, Inverter Network's primary focus was on enhancing security for their modular protocol designed for Primary Issuance Markets, with a scope covering various contract modules. The audit included 160 submissions, with a total reward of $68,131.45 distributed among 55 participants. This effective model emphasizes quality submissions by pioneering a pay-for-results ethos and retaining budgets if no vulnerabilities are found, demonstrating Hats.finance's commitment to high-standard, decentralized security assessments in the Web3 space.

## Disclaimer


This report does not assert that the audited contracts are completely secure. Continuous review and comprehensive testing are advised before deploying critical smart contracts.


The Inverter Network audit competition illustrates the collaborative effort in identifying and rectifying potential vulnerabilities, enhancing the overall security and functionality of the platform.


Hats.finance does not provide any guarantee or warranty regarding the security of this project. Smart contract software should be used at the sole risk and responsibility of users.

