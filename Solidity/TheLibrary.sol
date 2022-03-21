/**********************************************************************
░██████╗███╗░░░███╗░█████╗░██████╗░████████╗
██╔════╝████╗░████║██╔══██╗██╔══██╗╚══██╔══╝
╚█████╗░██╔████╔██║███████║██████╔╝░░░██║░░░
░╚═══██╗██║╚██╔╝██║██╔══██║██╔══██╗░░░██║░░░
██████╔╝██║░╚═╝░██║██║░░██║██║░░██║░░░██║░░░
╚═════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░

░█████╗░░█████╗░███╗░░██╗████████╗██████╗░░█████╗░░█████╗░████████╗
██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝
██║░░╚═╝██║░░██║██╔██╗██║░░░██║░░░██████╔╝███████║██║░░╚═╝░░░██║░░░
██║░░██╗██║░░██║██║╚████║░░░██║░░░██╔══██╗██╔══██║██║░░██╗░░░██║░░░
╚█████╔╝╚█████╔╝██║░╚███║░░░██║░░░██║░░██║██║░░██║╚█████╔╝░░░██║░░░
░╚════╝░░╚════╝░╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░

░██████╗████████╗░█████╗░██████╗░████████╗░░░
██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝░░░
╚█████╗░░░░██║░░░███████║██████╔╝░░░██║░░░░░░
░╚═══██╗░░░██║░░░██╔══██║██╔══██╗░░░██║░░░░░░
██████╔╝░░░██║░░░██║░░██║██║░░██║░░░██║░░░██╗
╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝

Smart Contract Information:
@author: Created by Matthew LeComte — https://MatthewLeComte.com/
@notice: For more applications go to — https://MatthewLeComte.com/projects
@dev: License Information — https://SPDX.org/licenses/MIT-advertising


**/ 
// SPDX-License-Identifier: MIT-advertising

// Solidity version.
// Above 0.8.13, and below version 0.9.0.
pragma solidity ^0.8.13 < 0.9.0;


// Import libraries and dependancies.
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

 
//////////////////////////////////////////////////////////////////////////////////////////////////////
// Telling the contract it is a descendant of the imported "ERC721" and "Ownable" contracts, and that it can use all of their code as it pleases or as it is forced to.
contract TheLibrary is ERC721, Ownable
/*
██████╗░██████╗░░█████╗░░██████╗░██████╗░░█████╗░███╗░░░███╗
██╔══██╗██╔══██╗██╔══██╗██╔════╝░██╔══██╗██╔══██╗████╗░████║
██████╔╝██████╔╝██║░░██║██║░░██╗░██████╔╝███████║██╔████╔██║
██╔═══╝░██╔══██╗██║░░██║██║░░╚██╗██╔══██╗██╔══██║██║╚██╔╝██║
██║░░░░░██║░░██║╚█████╔╝╚██████╔╝██║░░██║██║░░██║██║░╚═╝░██║
╚═╝░░░░░╚═╝░░╚═╝░╚════╝░░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝

░██████╗████████╗░█████╗░██████╗░████████╗░░░
██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝░░░
╚█████╗░░░░██║░░░███████║██████╔╝░░░██║░░░░░░
░╚═══██╗░░░██║░░░██╔══██║██╔══██╗░░░██║░░░░░░
██████╔╝░░░██║░░░██║░░██║██║░░██║░░░██║░░░██╗
╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝
*/ {


// So that everything isn't broken.
  using Strings for uint256;

/*  
  "Counters" is referencing the above imported contract "Counters.sol", and we are using the function
  "Counter" from that contract, ergo we see the following "Counters.Counter" referenced.
*/
  using Counters for Counters.Counter; // Incrementing NFTs with counters is more gas efficient.

// @notice: Setting global variables.

// Link the "Counter" function from our "Counters.sol" contract to the variable "supply".
  Counters.Counter private supply;

//  Strings:
// Set our NFT's base uri, e.g. the unique IPFS folder ID for the metadata (e.g. our ".json" files).
  string public uriPrefix = "QmSjsNoY4PvHXVES1rCehMR3HLRx1TrjJRU88Ws63wNtaD";
// Set our NFT's metadata format to ".json".
  string public uriSuffix = ".json";

//  Numbers:
// Set the cost to mint each NFT.
  uint256 public cost = 0.005 ether;
// Set the max supply of NFTs that can be minted - payout is calculated after the last NFT mint.  
  uint256 public maxSupply = 50;
// Set maximum amount of NFTs someone can mint per transaction.
  uint256 public maxMintAmountPerTx = 5;
// Where the money goes after the lottery ends.
  uint256 public winnerPercentage = 90;
  uint256 public ownerPercentage = 10;
// Random number used to pick the winner of this contract's lottery function.
  uint256 public randomWinningNum;

//  Booleans:
// For pauseing the contract.
  bool public paused = false;
// Check if the lottery winner is paid before paying the owner.
  bool public winnerPicked = false;
  bool internal winnerPaid = false;

//  Addresses:
// Address of the contract deployer/owner - see constructor below for more details.
  address payable ownerAddress;
  

///////////////////////////////////////////////////////////////////////////////////////////////
/*
░█████╗░░█████╗░███╗░░██╗░██████╗████████╗██████╗░██╗░░░██╗░█████╗░████████╗░█████╗░██████╗░
██╔══██╗██╔══██╗████╗░██║██╔════╝╚══██╔══╝██╔══██╗██║░░░██║██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗
██║░░╚═╝██║░░██║██╔██╗██║╚█████╗░░░░██║░░░██████╔╝██║░░░██║██║░░╚═╝░░░██║░░░██║░░██║██████╔╝
██║░░██╗██║░░██║██║╚████║░╚═══██╗░░░██║░░░██╔══██╗██║░░░██║██║░░██╗░░░██║░░░██║░░██║██╔══██╗
╚█████╔╝╚█████╔╝██║░╚███║██████╔╝░░░██║░░░██║░░██║╚██████╔╝╚█████╔╝░░░██║░░░╚█████╔╝██║░░██║
░╚════╝░░╚════╝░╚═╝░░╚══╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝░╚═════╝░░╚════╝░░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝
*/

  constructor() ERC721

   ("The Library", "CARD")
   // Name the project then set its ticker.

// @notice: The constructor will run one time only when the smart contract is first deployed onto the blockchain.

////////////////////////////////////////// Now Inside Constructor /////////////////////////////////////////////////////////////////////
{/* @dev: Constructor starts here.

░██████╗███████╗████████╗
██╔════╝██╔════╝╚══██╔══╝
╚█████╗░█████╗░░░░░██║░░░
░╚═══██╗██╔══╝░░░░░██║░░░
██████╔╝███████╗░░░██║░░░
╚═════╝░╚══════╝░░░╚═╝░░░

░█████╗░░██╗░░░░░░░██╗███╗░░██╗███████╗██████╗░
██╔══██╗░██║░░██╗░░██║████╗░██║██╔════╝██╔══██╗
██║░░██║░╚██╗████╗██╔╝██╔██╗██║█████╗░░██████╔╝
██║░░██║░░████╔═████║░██║╚████║██╔══╝░░██╔══██╗
╚█████╔╝░░╚██╔╝░╚██╔╝░██║░╚███║███████╗██║░░██║
░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝

   @dev @notice This sets the address that deploys the contract as the "ownerAddress" for use in paying
                the owner their percentage of the lottery if set. 
*/

     ownerAddress = payable(msg.sender);

// @dev: Constructor ends here.
}

////////////////////////////////////////////  Public - NFT Minting.  //////////////////////////////////////////////////////////
/*
███╗░░██╗███████╗████████╗
████╗░██║██╔════╝╚══██╔══╝
██╔██╗██║█████╗░░░░░██║░░░
██║╚████║██╔══╝░░░░░██║░░░
██║░╚███║██║░░░░░░░░██║░░░
╚═╝░░╚══╝╚═╝░░░░░░░░╚═╝░░░

███╗░░░███╗██╗███╗░░██╗████████╗██╗███╗░░██╗░██████╗░
████╗░████║██║████╗░██║╚══██╔══╝██║████╗░██║██╔════╝░
██╔████╔██║██║██╔██╗██║░░░██║░░░██║██╔██╗██║██║░░██╗░
██║╚██╔╝██║██║██║╚████║░░░██║░░░██║██║╚████║██║░░╚██╗
██║░╚═╝░██║██║██║░╚███║░░░██║░░░██║██║░╚███║╚██████╔╝
╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝╚═╝░░╚══╝░╚═════╝░
*/

 function totalSupply() public view returns (uint256) {
   return supply.current();
 }

// This modifier implements the more gas-efficient "Counters" contract along with other normal variables.
 modifier mintCompliance(uint256 _mintAmount) {
/* Require that the mint amount is greater than zero, and that the mint amount
   is equal to or less than the maxiumim amount allowed per transaction. */
    require(_mintAmount > 0 && _mintAmount <= maxMintAmountPerTx, "Invalid mint amount!");
    
/*  Mint an NFT if the max supply has not been reached.
    How it works: Current supply + the amount you want to mint must be less or equal to the max supply. */
    require(supply.current() + _mintAmount <= maxSupply, "Max supply has been reached!");

    // The contract should not allow minting if paused.
    require(!paused, "Contract is paused!");
    
    // The owner cannot mint an NFT.
    require(msg.sender != owner(), "Owner cannot mint!");

    // If the supply is less than the max, allow one more NFT to be minted.
    // The cost per NFT is designated in top-level variables.
    require(msg.value >= cost, "Not enough funds!");

    // If it's you minting the NFTs skip payment, only comes into affect if you enable owner minting in the top level shit.
    if (msg.sender != owner()) {
      // If it's a user minting the NFT charge them this amount, set to an amount other than cost and delete the top level cost variable to make this work.
      require(msg.value >= cost);
    // End of this 'if' statement.
    }
/* @notice:
    "_;" Is a required element of modifiers, essentially this is where the code of the function
        you attach the modifier to is parsed into.
*/
     _;    

/*   Useage example:    
     Imagine that if you add this modifier to a function that it will add that function's code here, then run it.
*/ 

 // Ending bracket for the "mintCompliance" modifier.
 }

/*
███╗░░░███╗██╗███╗░░██╗████████╗░░░
████╗░████║██║████╗░██║╚══██╔══╝░░░
██╔████╔██║██║██╔██╗██║░░░██║░░░░░░
██║╚██╔╝██║██║██║╚████║░░░██║░░░░░░
██║░╚═╝░██║██║██║░╚███║░░░██║░░░██╗
╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝
*/
// Becuase we are using the standard ERC721 contract we need to add our own minting loop.
function _mintLoop(address _receiver, uint256 _mintAmount) internal {
  for (uint256 number = 0; number < _mintAmount; number++) {
    supply.increment();
    _safeMint(_receiver, supply.current());
    }
  }

function mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount) {
   // @notice: All variables and requirements have been offloaded to the modifier "mintCompliance".

    // Set base values so that we can update them when the max supply is reached.
    address payable winnerAddress = payable(msg.sender);
    uint256 winnerPayout = 0;
    uint256 ownerPayout = 0;

/*
░██████╗████████╗███████╗██████╗░  ░░███╗░░
██╔════╝╚══██╔══╝██╔════╝██╔══██╗  ░████║░░
╚█████╗░░░░██║░░░█████╗░░██████╔╝  ██╔██║░░
░╚═══██╗░░░██║░░░██╔══╝░░██╔═══╝░  ╚═╝██║░░
██████╔╝░░░██║░░░███████╗██║░░░░░  ███████╗
╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░░░░  ╚══════╝
*/

   // @notice: This is for the lottery element. - decides payout for both the winner and owner.
   // @dev: If the current supply plus the mint amount is equal to the max supply then run this if-statement.
   if(supply.current() + _mintAmount == maxSupply - _mintAmount) {
   // Generates a random number for the NFT contract's winner.
   // The format for this is define a definite variable (such as msg.value), then assign it a "_name", see the three values, then their random "_names".
   uint256 _randomWinningNum = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, tx.gasprice))) % block.timestamp;
   // Force the number to be betwean 1, and the max supply before returning.
   randomWinningNum = (_randomWinningNum % maxSupply) + 1;
   // Set bool to true to contiune contract payout.
   winnerPicked = true;
   }

/*
░██████╗████████╗███████╗██████╗░  ██████╗░
██╔════╝╚══██╔══╝██╔════╝██╔══██╗  ╚════██╗
╚█████╗░░░░██║░░░█████╗░░██████╔╝  ░░███╔═╝
░╚═══██╗░░░██║░░░██╔══╝░░██╔═══╝░  ██╔══╝░░
██████╔╝░░░██║░░░███████╗██║░░░░░  ███████╗
╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░░░░  ╚══════╝
*/
   if(winnerPicked = true && randomWinningNum != 0) {
  
   winnerAddress = payable(ownerOf(randomWinningNum));
   winnerPayout = supply.current() + _mintAmount == maxSupply ? address(this).balance * winnerPercentage / 100 : msg.value * winnerPercentage / 100;
   // Require success before sending the value (money) to the address that has been selected.
   (bool success, ) = payable(winnerAddress).call{value: winnerPayout}("");
   require(success, "Could not send value!"); 
   winnerPaid = true;
   }

/*
░██████╗████████╗███████╗██████╗░  ██████╗░
██╔════╝╚══██╔══╝██╔════╝██╔══██╗  ╚════██╗
╚█████╗░░░░██║░░░█████╗░░██████╔╝  ░█████╔╝
░╚═══██╗░░░██║░░░██╔══╝░░██╔═══╝░  ░╚═══██╗
██████╔╝░░░██║░░░███████╗██║░░░░░  ██████╔╝
╚═════╝░░░░╚═╝░░░╚══════╝╚═╝░░░░░  ╚═════╝░
*/
   if(winnerPaid == true) {
   // Require success before sending the value (money) to the owner's address.
   ownerPayout = supply.current() + _mintAmount == maxSupply ? address(this).balance * 100 / 100 : msg.value * 100 / 100;
   (bool payOwner, ) = payable(ownerAddress).call{value: ownerPayout}("");
   // Require success before sending the value (money) to the address that has been selected.
   require(payOwner);
   }
 
  // After all checks have passed mint NFTs.
  _mintLoop(msg.sender, _mintAmount);
 
  // Final closing bracket to close the minting function.           
 }

//////////////// NFT Minting Ends. ///////////////////////////////////////////////////////////////////////////////////
/*
░█████╗░██╗░░██╗███████╗░█████╗░██╗░░██╗
██╔══██╗██║░░██║██╔════╝██╔══██╗██║░██╔╝
██║░░╚═╝███████║█████╗░░██║░░╚═╝█████═╝░
██║░░██╗██╔══██║██╔══╝░░██║░░██╗██╔═██╗░
╚█████╔╝██║░░██║███████╗╚█████╔╝██║░╚██╗
░╚════╝░╚═╝░░╚═╝╚══════╝░╚════╝░╚═╝░░╚═╝

███╗░░░███╗██╗███╗░░██╗████████╗░░░
████╗░████║██║████╗░██║╚══██╔══╝░░░
██╔████╔██║██║██╔██╗██║░░░██║░░░░░░
██║╚██╔╝██║██║██║╚████║░░░██║░░░░░░
██║░╚═╝░██║██║██║░╚███║░░░██║░░░██╗
╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝
*/

// Check base uri.
  function _baseURI() internal view virtual override returns (string memory) {
    return uriPrefix;
  }

// Query NFT.
  function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
    require(_exists(_tokenId), "ERC721Metadata: URI query for nonexistent token");
    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0 ? string(abi.encodePacked(currentBaseURI, _tokenId.toString(), uriSuffix)): "";
  }

// Returns all the NFTs that a wallet owns from this collection.
  function walletOfOwner(address _owner) public view returns (uint256[] memory) {
    
    uint256 ownerTokenCount = balanceOf(_owner);
    uint256[] memory ownedTokenIds = new uint256[](ownerTokenCount);
    uint256 currentTokenId = 1;
    uint256 ownedTokenIndex = 0;
    
    // Using a "While" loop saves gas as it finishes once it finds what it's looking for instead of checking everything.
    while (ownedTokenIndex < ownerTokenCount && currentTokenId <= maxSupply) {
      address currentTokenOwner = ownerOf(currentTokenId);

      if (currentTokenOwner == _owner) {
        ownedTokenIds[ownedTokenIndex] = currentTokenId;
        ownedTokenIndex++;
      }
      currentTokenId++;
    }
    return ownedTokenIds;
  }

//////////////// Function for Listing on OpenSea. ////////////////////////////////////////////////////////////////////////////
/*
░█████╗░██████╗░███████╗███╗░░██╗░██████╗███████╗░█████╗░
██╔══██╗██╔══██╗██╔════╝████╗░██║██╔════╝██╔════╝██╔══██╗
██║░░██║██████╔╝█████╗░░██╔██╗██║╚█████╗░█████╗░░███████║
██║░░██║██╔═══╝░██╔══╝░░██║╚████║░╚═══██╗██╔══╝░░██╔══██║
╚█████╔╝██║░░░░░███████╗██║░╚███║██████╔╝███████╗██║░░██║
░╚════╝░╚═╝░░░░░╚══════╝╚═╝░░╚══╝╚═════╝░╚══════╝╚═╝░░╚═╝
  Override ERC711.sol's restrictions to auto-approve OpenSea's proxy contract for listing on OpenSea.
*/

  function isApprovedForAll(
      address _owner,
    address _operator
    ) public override view returns (bool isOperator) {
    // if OpenSea's ERC721 Proxy Address is detected, auto-return true
      if (_operator == address(0x58807baD0B376efc12F5AD86aAc70E78ed67deaE)) {
       return true;
      }    
      // otherwise, use the default ERC721.isApprovedForAll()
   return ERC721.isApprovedForAll(_owner, _operator);
  }

//////////////// Functions for Owner. ///////////////////////////////////////////////////////////////////////////////////
/*
░█████╗░░██╗░░░░░░░██╗███╗░░██╗███████╗██████╗░  ███████╗██╗░░░██╗░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗░░░
██╔══██╗░██║░░██╗░░██║████╗░██║██╔════╝██╔══██╗  ██╔════╝██║░░░██║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝░░░
██║░░██║░╚██╗████╗██╔╝██╔██╗██║█████╗░░██████╔╝  █████╗░░██║░░░██║██║░░╚═╝░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░░░░
██║░░██║░░████╔═████║░██║╚████║██╔══╝░░██╔══██╗  ██╔══╝░░██║░░░██║██║░░██╗░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗░░░
╚█████╔╝░░╚██╔╝░╚██╔╝░██║░╚███║███████╗██║░░██║  ██║░░░░░╚██████╔╝╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝██╗
░╚════╝░░░░╚═╝░░░╚═╝░░╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝  ╚═╝░░░░░░╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░╚═╝
*/

// Update the cost per NFT.
 function setCost(uint256 _cost) public onlyOwner {
    cost = _cost;
  }
// Update the maximum amount of NFTs that can be minted per transaction.
 function setMaxMintAmountPerTx(uint256 _maxMintAmountPerTx) public onlyOwner {
    maxMintAmountPerTx = _maxMintAmountPerTx;
  }
// Update the base uri of the contract.
 function setUriPrefix(string memory _uriPrefix) public onlyOwner {
    uriPrefix = _uriPrefix;
  }
// Update the format of metadata you would like to use, currently ".json" is used.
 function setUriSuffix(string memory _uriSuffix) public onlyOwner {
    uriSuffix = _uriSuffix;
  }
// Pause or unpause the smart contract.
 function pauseContract(bool _state) public onlyOwner {
    paused = _state;
  }

/* @notice: Setting the actual contract "owner" variable is done off-contract via the imported "Ownable" contract,
   and thus is redundant to implement in this contract.
*/

// Update the owner of the contract's "ownerPayout", aka what address gets paid the "ownerPercentage" of the prize pool set in the topline variables.
 function setOwnerAddress(address payable _newOwnerAddress) public onlyOwner {
    ownerAddress = _newOwnerAddress;
  }

//////////////// Payment for Owner. ///////////////////////////////////////////////////////////////////////////////////
/*
██████╗░░█████╗░██╗░░░██╗███╗░░░███╗███████╗███╗░░██╗████████╗░░░
██╔══██╗██╔══██╗╚██╗░██╔╝████╗░████║██╔════╝████╗░██║╚══██╔══╝░░░
██████╔╝███████║░╚████╔╝░██╔████╔██║█████╗░░██╔██╗██║░░░██║░░░░░░
██╔═══╝░██╔══██║░░╚██╔╝░░██║╚██╔╝██║██╔══╝░░██║╚████║░░░██║░░░░░░
██║░░░░░██║░░██║░░░██║░░░██║░╚═╝░██║███████╗██║░╚███║░░░██║░░░██╗
╚═╝░░░░░╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░░░░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═╝
*/
/* @dev: Enables the withdrawing of funds from the contract by the owner, currently only
   available after the max supply has been reached. 
*/

 function withdraw() public payable onlyOwner {
    require(supply.current() == maxSupply, "Cannot withdraw yet.");
    // ============================================================================
    // Do not remove this otherwise you will not be able to withdraw the funds.
    // ============================================================================
    (bool s, ) = payable(msg.sender).call{value: address(this).balance}("");
    require(s);
  }

//-----------------------------------------------------------------------------------------------------------------------
/*
░██████╗███╗░░░███╗░█████╗░██████╗░████████╗
██╔════╝████╗░████║██╔══██╗██╔══██╗╚══██╔══╝
╚█████╗░██╔████╔██║███████║██████╔╝░░░██║░░░
░╚═══██╗██║╚██╔╝██║██╔══██║██╔══██╗░░░██║░░░
██████╔╝██║░╚═╝░██║██║░░██║██║░░██║░░░██║░░░
╚═════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░

░█████╗░░█████╗░███╗░░██╗████████╗██████╗░░█████╗░░█████╗░████████╗
██╔══██╗██╔══██╗████╗░██║╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝
██║░░╚═╝██║░░██║██╔██╗██║░░░██║░░░██████╔╝███████║██║░░╚═╝░░░██║░░░
██║░░██╗██║░░██║██║╚████║░░░██║░░░██╔══██╗██╔══██║██║░░██╗░░░██║░░░
╚█████╔╝╚█████╔╝██║░╚███║░░░██║░░░██║░░██║██║░░██║╚█████╔╝░░░██║░░░
░╚════╝░░╚════╝░╚═╝░░╚══╝░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░

███████╗███╗░░██╗██████╗░░░░
██╔════╝████╗░██║██╔══██╗░░░
█████╗░░██╔██╗██║██║░░██║░░░
██╔══╝░░██║╚████║██║░░██║░░░
███████╗██║░╚███║██████╔╝██╗
╚══════╝╚═╝░░╚══╝╚═════╝░╚═╝*/

// This Contract Ends Here. Thank you For Reading. ❤︎
 }
