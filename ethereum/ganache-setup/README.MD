# Ganache - Local Ethereum Network

Setup of Ganache is available under Remix and Truffle examples also.

## 1. Setup Ganache Local Ethereum Network
 
### 1.1 Go to Ganache Web Site

https://trufflesuite.com/ganache/ 

![Remix IDE](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/Ganache-Site.jpg)

### 1.2 Run the Ganache Desktop App

![Remix IDE](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/Ganache-App-1.jpg)

Check the RPC Server IP and Port Number. You need to give this in REMIX IDE for Web3 Provider Integration.

![Remix IDE](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/Ganache-App-2.jpg)

## 2. Setup Ganache Command line Utility

### 2.1 Install Ganache Test Network

```shell
npm install --save-dev ganache-cli
npx ganache-cli --deterministic
```
![Ganache Network](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/Ganache-Cli.jpg)

### 2.2 Configure Truffle with Ganache Network

![Ganache Network](https://raw.githubusercontent.com/MetaArivu/blockchain-examples/master/images/Truffle-Config.jpg)