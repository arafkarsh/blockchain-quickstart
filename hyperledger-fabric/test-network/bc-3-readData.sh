#!/bin/bash
echo "Read Asset Data Ex. asset1, asset2 etc >>> "$1
peer chaincode query -C mychannel -n basic -c '{"Args":["ReadAsset","'$1'"]}'
echo "-------------------------------------------------------------------------"
