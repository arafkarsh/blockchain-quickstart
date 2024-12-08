# Hyperledger Fabric Binaries


## For Mac OS (Current Version) 

These are Mac OS 64 Bit Executable Binaries

HyperLedger Fabric v2.2

https://hyperledger-fabric.readthedocs.io/en/release-2.2/

## For Linux (Ubuntu and other flavors)

Move the Current binaries to macos folder (inside the bin folder)
```shell
mv * macos
cd linux
cp * ../
```

## To Download the Latest Version

To Download the OS Specific Latest Versions of these binaries 

```shell
curl -sSL https://bit.ly/2ysbOFE | bash -s
```

The command above downloads and executes a bash script that will download and extract all of the platform-specific binaries you will need to set up your network. It retrieves the following platform-specific binaries:

- configtxgen
- configtxlator
- cryptogen
- discover
- idemixgen
- orderer
- peer
- fabric-ca-client
- fabric-ca-server

and places them in the bin sub-directory of the current working directory.

From the downloaded folder place the binaries in this "bin" folder for the samples to work
OR export the PATH "export PATH=path to download location/bin:$PATH"

For more detailed install instructions please refer 
https://hyperledger-fabric.readthedocs.io/en/release-2.2/test_network.html




