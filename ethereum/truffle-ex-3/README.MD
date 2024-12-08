# Ethereum Solidity Smart Contract Examples

## Pre-Reuisites

Install the NPM and Visual Studio Code

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

Code Example 
<img>

### 2.2 Compile the Contract
```shell
npx truffle compile
```

### 2.3 Install Open Zeppelin Smart Contracts Framework

```shell
npm install --save-dev @openzeppelin/contracts
```

### 2.4 Install Ganache Test Network

```shell
npm install --save-dev ganache-cli
npx ganache-cli --deterministic
```

### 2.5 Write the Deployment Script for the Smart Contract

<img>

### 2.6 Deploy the Smart Contract

```shell
npx truffle migrate --network development
```

OR

```shell
npx truffle deploy
```


## 3. Client Side Coding

### 3.1 Write the Client Side Code to execute the Smart Contract

<img>


### 3.2 Execute the Client Side Code (Web3 using API)

```shell
npx truffle exec --network development ./scripts/storage-client-1.js
npx truffle exec --network development ./scripts/storage-client-2.js
```

## 4. Automated Test Cases

### 4.1 Setup the Testing Framework

```shell
npm install --save-dev chai
```

### 4.2 Run the Automated Test Cases

```shell
npx truffle test
```
