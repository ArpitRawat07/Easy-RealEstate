// //SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


// ERC721.sol provides the basic implementation of the ERC721 standard, which is used for creating non-fungible tokens (NFTs).
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// ERC721URIStorage.sol extends ERC721 to include functions for storing and retrieving token metadata URIs.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// Counters.sol is used to manage a counter for generating unique token IDs.
import "@openzeppelin/contracts/utils/Counters.sol";


// This line defines the start of the RealEstate contract, which inherits from ERC721URIStorage. This means the RealEstate contract will have all the functionalities of the ERC721 standard along with additional functions for handling token metadata URIs.
contract RealEstate is ERC721URIStorage{

// 	The 'using' statement allows using the Counters library to manage a counter for generating unique token IDs.
// _tokenIds is a private variable of type Counters.Counter. It is used to keep track of the latest token ID assigned to a newly minted NFT.
	using Counters for Counters.Counter;
	Counters.Counter private _tokenIds;


// This is the constructor function for the RealEstate contract.
// It calls the constructor of the parent ERC721 contract with the parameters "Real Estate" (token name) and "REAL" (token symbol) to initialize the NFT with the given name and symbol.
	constructor() ERC721("Real Estate","REAL") {}


// This function mint is used to create and mint a new NFT.
// The function takes a tokenURI as input, which is a string representing the URI (URL) of the token's metadata.
	function mint(string memory tokenURI) public returns (uint256){
		// _tokenIds.increment() increments the counter, generating a new unique token ID for the NFT.
		_tokenIds.increment();
		uint256 newItemId = _tokenIds.current();

		// _mint(msg.sender, newItemId) mints the NFT, associating it with the address of the sender (msg.sender), who becomes the owner of the newly created NFT.
		_mint(msg.sender,newItemId);

		// _setTokenURI(newItemId, tokenURI) sets the metadata URI for the new NFT with the provided tokenURI.
		_setTokenURI(newItemId, tokenURI);

		// The function returns the newly minted NFT's token ID (newItemId).
		return newItemId;
	}

// This function totalSupply is a public view function that returns the total number of NFTs created by the contract.
	function totalSupply() public view returns (uint256){
		// It does so by returning the current value of the _tokenIds counter, which represents the total number of NFTs minted so far.
		return _tokenIds.current();
	}
}


// This contract is an ERC721-compliant NFT (Non-Fungible Token) contract.
// It extends the OpenZeppelin ERC721URIStorage contract, which provides support for token metadata storage and retrieval.
// The contract has a mint function that allows the contract owner to create new NFTs.
// Each NFT is associated with a unique token URI, which points to off-chain metadata providing additional information about the NFT.
// The totalSupply function returns the total number of NFTs created by the contract.