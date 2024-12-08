# Ethereum Solidity Smart Contract Examples

## Pre-Reuisites

Install the NPM and Visual Studio Code

```shell
node --version
```
Node Version: v16.15.1
Visual Studio Code: 1.67.2

![VS](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/VS-Version.jpg)

## 1. Setup

### 1.1 Setup the Project (Create Directory and Initialize it)

```shell
mkdir ethereum-ex-1
cd ethereum-ex-1
npm init -y
```

### 1.2 Install Hardhat and initialize the project with Hardhat (Sets the Solidity Config)

```shell
npm install --save-dev hardhat
npx hardhat
```

## 2. Code / Compile / Execute

### 2.1 Write the Solidity (0.8.x) Contract 

Smart Code Example 

![Smart Contract](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/SM-Solidity-Ex-1.jpg)

### 2.2 Compile the Contract
```shell
npx hardhat compile
```
![Compile](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/HH-Compile-Ex-1.jpg)


### 2.3 Install Open Zeppelin Smart Contracts Framework

```shell
npm install --save-dev @openzeppelin/contracts
```

### 2.4 Install HardHat Test Network

```shell
npx hardhat node
```
![Ganache Network](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/HH-Network-Node-Cli.jpg)

### 2.5 Install Ethers package from HardHat & update config.

Deployment Script need ethers package from Hardhat.
```shell
npm install --save-dev @nomiclabs/hardhat-ethers ethers
```
Updated the ethers package in the hardhat.config.js config.

![Deploy](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/HH-Ethers-Config.jpg)

### 2.6 Write the Deployment Script for the Smart Contract

![Deploy](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/HH-SC-Deploy-Ex-1.jpg)

### 2.7 Deploy the Smart Contract using Hardhat

```shell
npx hardhat run --network localhost scripts/deploy.js
```

![Deploy Result](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/HH-Deploy-Result.jpg)


## 3. Client Side Coding

### 3.1 Write the Client Side Code to execute the Smart Contract

![Client Code](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/SM-Client-Ex-1-A.jpg)


### 3.2 Execute the Client Side Code (Web3 using API)

```shell
npx hardhat run --network localhost ./scripts/Box-client.js
```

![Client Code Result](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/HH-Box-Client-Ex-1.jpg)

## 4. Automated Test Cases

### 4.1 Setup the Testing Framework

```shell
npm install --save-dev chai
```

### 4.2 Run the Automated Test Cases

```shell
npx hardhat test
```

![Client Code Result](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/HH-Test-Ex-1.jpg)
