#!/bin/bash

echo "##################  Using the CLI Container to execute commands ##################"
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

echo "################## Creating the Channel ################"
peer channel create -o orderer.example.com:7050 -c channel13 -f /opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts/channel13.tx --tls --cafile $ORDERER_CA



echo "################## Joining Patient Peer to Channel ################"
CORE_PEER_LOCALMSPID="PatientMSP" 
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/patient.example.com/peers/peer0.patient.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/patient.example.com/users/Admin@patient.example.com/msp
CORE_PEER_ADDRESS=peer0.patient.example.com:7051
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

peer channel join -b channel13.block --tls --cafile $ORDERER_CA
peer channel update -o orderer.example.com:7050 -c channel13 -f /opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts/PatientMSPanchors_channel13.tx --tls --cafile $ORDERER_CA
echo "################## Patient Peer Joined and Anchor Peer Updated ################"



echo "################## Joining GovtHos Peer to Channel ################"
CORE_PEER_LOCALMSPID="GovtHosMSP" 
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/govthos.example.com/peers/peer0.govthos.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/govthos.example.com/users/Admin@govthos.example.com/msp
CORE_PEER_ADDRESS=peer0.govthos.example.com:8051
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

peer channel join -b channel13.block --tls --cafile $ORDERER_CA
peer channel update -o orderer.example.com:7050 -c channel13 -f /opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts/GovtHosMSPanchors_channel13.tx --tls --cafile $ORDERER_CA
echo "################## GovtHos Peer Joined and Anchor Peer Updated ################"


echo "################## Joining PHC Peer to Channel ################"
CORE_PEER_LOCALMSPID="PHCMSP" 
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/phc.example.com/peers/peer0.phc.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/phc.example.com/users/Admin@phc.example.com/msp
CORE_PEER_ADDRESS=peer0.phc.example.com:9051
export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

peer channel join -b channel13.block --tls --cafile $ORDERER_CA
peer channel update -o orderer.example.com:7050 -c channel13 -f /opt/gopath/src/github.com/hyperledger/fabric/peer/channel-artifacts/PHCMSPanchors_channel13.tx --tls --cafile $ORDERER_CA
echo "################## PHC Peer Joined and Anchor Peer Updated ################"


echo "############# Check if channel has been created successfully ##############"
peer channel list

