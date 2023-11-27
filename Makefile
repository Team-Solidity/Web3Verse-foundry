-include .env

build:; forge build

create:; forge create Web3Verse --rpc-url $(MUMBAI) --broadcast --private-key $(PRIVATE_KEY) --broadcast


# Combine deploy
mumbai:
	forge script script/Web3Verse.s.sol:DeployWeb3Verse --rpc-url $(MUMBAI) --broadcast --private-key $(PRIVATE_KEY) --verify --etherscan-api-key $(POLYGONSCAN_APIKEY) -vvvv

	forge script script/Web3VerseNFT.s.sol:DeployWeb3VerseNFT --rpc-url $(MUMBAI) --broadcast --private-key $(PRIVATE_KEY) --verify --etherscan-api-key $(POLYGONSCAN_APIKEY) -vvvv

mumbai-nover:
	forge script script/Web3Verse.s.sol:DeployWeb3Verse --rpc-url $(MUMBAI) --broadcast --private-key $(PRIVATE_KEY) -vvvv

	forge script script/Web3VerseNFT.s.sol:DeployWeb3VerseNFT --rpc-url $(MUMBAI) --broadcast --private-key $(PRIVATE_KEY) -vvvv


# Social Media Contract
mumbai-w3v:
	forge script script/Web3Verse.s.sol:DeployWeb3Verse --rpc-url $(MUMBAI) --broadcast --private-key $(PRIVATE_KEY) --verify --etherscan-api-key $(POLYGONSCAN_APIKEY) -vvvv

mumbai-w3v-nover:
	forge script script/Web3Verse.s.sol:DeployWeb3Verse --rpc-url $(MUMBAI) --broadcast --private-key $(PRIVATE_KEY) -vvvv

ganache-w3v:
	forge script script/Web3Verse.s.sol:DeployWeb3Verse --rpc-url $(GANACHE) --broadcast --private-key $(GANACHE_PRIVATE_KEY) -vvvv


# NFT Contract
mumbai-nft:
	forge script script/Web3VerseNFT.s.sol:DeployWeb3VerseNFT --rpc-url $(MUMBAI) --broadcast --private-key $(PRIVATE_KEY) --verify --etherscan-api-key $(POLYGONSCAN_APIKEY) -vvvv

mumbai-nft-nover:
	forge script script/Web3VerseNFT.s.sol:DeployWeb3VerseNFT --rpc-url $(MUMBAI) --broadcast --private-key $(PRIVATE_KEY) -vvvv

ganache-nft:
	forge script script/Web3VerseNFT.s.sol:DeployWeb3VerseNFT --rpc-url $(GANACHE) --broadcast --private-key $(GANACHE_PRIVATE_KEY) -vvvv