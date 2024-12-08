# Hyperledger Fabric Setup


## 1. Setup Fabric Docker containers

### 1.1 Download the Platform specific binaries

Go the bin directory and read the instructions to download the platform specific binaries and place them in the bin folder.

Current binaries are for Mac OS

```shell
cd bin
```

### 1.2 Make the binaries executable
```shell
cd bin
chmod +x *
cd ../
```

### 1.3 Download the Containers

```shell
install-fabric.sh docker sample
```

### 1.4 Setup blockchain Network 

Hyperledger Fabric Network with 2 Orgs (1 Peer each) 1 Orderer and 3 CA's and default channels

Go to the Test Network Folder
```shell
cd test-network
```

```shell
network.sh up createChannel -c mychannel -ca
```
OR
```shell
bc-0-create-network.sh
```

## 2. Deploy the Smart Contract

### 2.1 Deploy Java Chain Code

```shell
network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-java -ccl java
```
OR
```shell
bc-0-deploy-chaincode.sh
```


### 2.2 Set Fabric Bin Path

```shell
export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=$PWD/../config/
```

### 2.3 Set Env Vars for Org 1

```shell
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051
```

## Test the Contract

### 3.1 Initialize the Ledger 

```shell
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"InitLedger","Args":[]}' 
```
OR
```shell
bc-1-initLedger.sh
```


### 3.2 Query the Ledger 

```shell
peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}’
```
OR
```shell
bc-2-getAllRecords.sh
```


### 3.3 Query the Ledger for a Specific Asset 

```shell
peer chaincode query -C mychannel -n basic -c '{"Args":["ReadAsset","asset6"]}'
```
OR
```shell
bc-3-readData.sh 6
```


### 3.4 Transfer the Asset from Person A to Person B

```shell
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"TransferAsset","Args":["asset6","Christopher"]}' 
```
OR
```shell
bc-4-changeOwnership.sh
```

### 3.4 Query the Ledger to check the new Asset Owner 

```shell
peer chaincode query -C mychannel -n basic -c '{"Args":["ReadAsset","asset6"]}'
```
OR
```shell
bc-3-readData.sh 6
```

