

echo "Creating channel genesis block.."

# Create the channel
docker exec -e "CORE_PEER_LOCALMSPID=Company1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company1.insurance.com/users/Admin@company1.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer0.company1.insurance.com:7051" cli peer channel create -o orderer.insurance.com:7050 -c mychannel -f /etc/hyperledger/configtx/channel.tx


#sleep 5

echo "Channel genesis block created."

echo "peer0.company1.insurance.com joining the channel..."
# Join peer0.company1.insurance.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=Company1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company1.insurance.com/users/Admin@company1.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer0.company1.insurance.com:7051" cli peer channel join -b mychannel.block

#echo "peer0.company1.insurance.com joined the channel"

echo "peer1.company1.insurance.com joining the channel..."
# Join peer1.company1.insurance.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=Company1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company1.insurance.com/users/Admin@company1.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer1.company1.insurance.com:7051" cli peer channel join -b mychannel.block

echo "peer1.company1.insurance.com joined the channel"


echo "peer0.company2.insurance.com joining the channel..."

# Join peer0.company2.insurance.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=Company2MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company2.insurance.com/users/Admin@company2.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer0.company2.insurance.com:7051" cli peer channel join -b mychannel.block

echo "peer0.company2.insurance.com joined the channel"

echo "peer1.company2.insurance.com joining the channel..."

# Join peer1.company2.insurance.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=Company2MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company2.insurance.com/users/Admin@company2.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer1.company2.insurance.com:7051" cli peer channel join -b mychannel.block

echo "peer1.company2.insurance.com joined the channel"

echo "peer0.company3.insurance.com joining the channel..."
# Join peer0.company3.insurance.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=Company3MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company3.insurance.com/users/Admin@company3.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer0.company3.insurance.com:7051" cli peer channel join -b mychannel.block
sleep 5

echo "peer0.company3.insurance.com joined the channel"

echo "peer1.company3.insurance.com joining the channel..."
# Join peer1.company3.insurance.com to the channel.
docker exec -e "CORE_PEER_LOCALMSPID=Company3MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company3.insurance.com/users/Admin@company3.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer1.company3.insurance.com:7051" cli peer channel join -b mychannel.block
sleep 5

echo "peer1.company3.insurance.com joined the channel"

echo "Installing insurance chaincode to peer0.company1.insurance.com..."

# install chaincode
# Install code on company1 peer
docker exec -e "CORE_PEER_LOCALMSPID=Company1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company1.insurance.com/users/Admin@company1.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer0.company1.insurance.com:7051" cli peer chaincode install -n insurance -v 1.0 -p github.com/insurance/go -l golang

echo "Installed insurance chaincode to peer0.company1.insurance.com"

echo "Installing insurance chaincode to peer1.company1.insurance.com..."

# install chaincode
# Install code on company1 peer
docker exec -e "CORE_PEER_LOCALMSPID=Company1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company1.insurance.com/users/Admin@company1.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer1.company1.insurance.com:7051" cli peer chaincode install -n insurance -v 1.0 -p github.com/insurance/go -l golang

echo "Installed insurance chaincode to peer1.company1.insurance.com"


echo "Installing insurance chaincode to peer0.company2.insurance.com...."

# Install code on company2 peer
docker exec -e "CORE_PEER_LOCALMSPID=Company2MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company2.insurance.com/users/Admin@company2.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer0.company2.insurance.com:7051" cli peer chaincode install -n insurance -v 1.0 -p github.com/insurance/go -l golang

echo "Installed insurance chaincode to peer0.company2.insurance.com"

echo "Installing insurance chaincode to peer1.company2.insurance.com...."

# Install code on company2 peer
docker exec -e "CORE_PEER_LOCALMSPID=Company2MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company2.insurance.com/users/Admin@company2.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer1.company2.insurance.com:7051" cli peer chaincode install -n insurance -v 1.0 -p github.com/insurance/go -l golang

sleep 5

echo "Installed insurance chaincode to peer1.company2.insurance.com"

echo "Installing insurance chaincode to peer0.company3.insurance.com..."
# Install code on company3 peer
docker exec -e "CORE_PEER_LOCALMSPID=Company3MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company3.insurance.com/users/Admin@company3.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer0.company3.insurance.com:7051" cli peer chaincode install -n insurance -v 1.0 -p github.com/insurance/go -l golang

sleep 5

echo "Installed insurance chaincode to peer0.company3.insurance.com"

echo "Installing insurance chaincode to peer1.company3.insurance.com..."
# Install code on company3 peer
docker exec -e "CORE_PEER_LOCALMSPID=Company3MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company3.insurance.com/users/Admin@company3.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer1.company3.insurance.com:7051" cli peer chaincode install -n insurance -v 1.0 -p github.com/insurance/go -l golang

sleep 5

echo "Installed insurance chaincode to peer1.company3.insurance.com"


echo "Instantiating insurance chaincode.."

docker exec -e "CORE_PEER_LOCALMSPID=Company1MSP" -e "CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/company1.insurance.com/users/Admin@company1.insurance.com/msp" -e "CORE_PEER_ADDRESS=peer0.company1.insurance.com:7051" cli peer chaincode instantiate -o orderer.insurance.com:7050 -C mychannel -n insurance -l golang -v 1.0 -c '{"Args":[""]}' -P "OR ('Company1MSP.member','Company2MSP.member','Company3MSP.member')"

echo "Instantiated insurance chaincode."

echo "Following is the docker network....."

docker ps
