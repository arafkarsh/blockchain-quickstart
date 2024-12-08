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

### 1.2 Install Truffle and initialize the project with Truffle (Sets the Solidity Config)

```shell
npm install --save-dev truffle
npx truffle init
```

## 2. Code / Compile / Execute

### 2.1 Write the Solidity (0.8.x) Contract 

Smart Code Example 

![Smart Contract](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/SM-Solidity-Ex-1.jpg)

### 2.2 Compile the Contract
```shell
npx truffle compile
```
![Compile](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/Truffle-Compile-Ex-1.jpg)


### 2.3 Install Open Zeppelin Smart Contracts Framework

```shell
npm install --save-dev @openzeppelin/contracts
```

### 2.4 Install Ganache Test Network

```shell
npm install --save-dev ganache-cli
npx ganache-cli --deterministic
```
![Ganache Network](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/Ganache-Cli.jpg)

### 2.5 Configure Truffle with Ganache Network

![Ganache Network](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/Truffle-Config.jpg)

### 2.6 Write the Deployment Script for the Smart Contract

![Deploy](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/SM-Deploy-Ex-1.jpg)

### 2.7 Deploy the Smart Contract

```shell
npx truffle migrate --network development
```

OR

```shell
npx truffle deploy
```

![Deploy Result](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/SM-Deploy-Ex-1-Result.jpg)


## 3. Client Side Coding

### 3.1 Write the Client Side Code to execute the Smart Contract

![Client Code](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/SM-Client-Ex-1-A.jpg)


### 3.2 Execute the Client Side Code (Web3 using API)

```shell
npx truffle exec --network development ./scripts/Box-client-1.js
```

```shell
npx truffle exec --network development ./scripts/Box-client-2.js
```

![Client Code Result](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/SM-Client-Exec-Ex-1.jpg)

## 4. Automated Test Cases

### 4.1 Setup the Testing Framework

```shell
npm install --save-dev chai
```

### 4.2 Run the Automated Test Cases

```shell
npx truffle test
```

![Client Code Result](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/SM-Test-Ex-1.jpg)
