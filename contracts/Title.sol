pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;
/**
    Owner address
 */
contract Ownable {

  address public owner;

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
  }

    function getOwner() public returns(address){
        return owner;
    }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }
  
  
//Certificate of Incorporation

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param newOwner The address to transfer ownership to.
   */
  function transferOwnership(address newOwner) private onlyOwner {
    require(newOwner != address(0));      
    owner = newOwner;
  }

}

/**
 * @title Destructible
 * @dev Base contract that can be destroyed by owner. All funds in contract will be sent to the owner.
 */
contract Destructible is Ownable {

  constructor() public { } 

  /**
   * @dev Transfers the current balance to the owner and terminates the contract. 
   */
  function destroy() private onlyOwner {
    selfdestruct(msg.sender);
  }
}

// validate the Title and return true if title is clean
contract Title is Ownable, Destructible {
    
    enum TxType { Sale, Will, Foreclosure, Mortgage, CertOfInc, RefDeed}
    //price[msg.sender] = 100;
    // uint public balance;
  //mapping(address => uint) public balance;
      TxType public status = TxType.Sale; 

    struct Person{
        string name;
        
    }
    
    uint public PropartyIdCount;
    
    struct Proparty {
        uint id;
        string homeAddress;
        address buyer;
        address seller;
        string date;
        TxType tx;
        uint price;
    }
    
    mapping(address => Proparty) public home;
    
     
    function getHomeId() public returns(uint){
        return home[super.getOwner()].id;
    }
   
    constructor(string memory title) public {
        PropartyIdCount = 1;
        TxType transaction;
        home[super.getOwner()].id = PropartyIdCount;
        home[super.getOwner()].homeAddress = title;
        home[super.getOwner()].tx = status;
    }
    
    //buy a house
  function buy() public payable {
      PropartyIdCount +=1;
      
  } 
  //sell a house
  function sell() public payable {
      
  } 
  // inherit a house
  function inheritance() public payable {
      
  } 


}

contract Tax is Title{
    
    struct Taxes {
        uint id;
        string owner;
        uint taxYear;
        bool taxRecieved;
        uint amount;
    }
    
    address[16] public seller;
    Taxes public tx;
    constructor() public{
        tx.taxRecieved = false;
     }
    
    function taxIsPayed(uint id) public returns(bool){
        require(id >= 0 && id <= 16);
        
        seller[id] =  home[super.getOwner()].seller;
        
        if  (tx.taxRecieved == false){
            return false;
        }
        
    }
}
