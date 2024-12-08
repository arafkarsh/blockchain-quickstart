#!/bin/bash
echo "Asset 6 Current Ownership"
peer chaincode query -C mychannel -n basic -c '{"Args":["ReadAsset","asset6"]}'
echo "-------------------------------------------------------------------------"
echo "Changing ownership to $1"
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --tls --cafile "${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem" -C mychannel -n basic --peerAddresses localhost:7051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt" --peerAddresses localhost:9051 --tlsRootCertFiles "${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt" -c '{"function":"TransferAsset","Args":["asset6","'$1'"]}'

sleep  5
echo "-------------------------------------------------------------------------"
echo "Asset 6 New Ownership"
peer chaincode query -C mychannel -n basic -c '{"Args":["ReadAsset","asset6"]}'
