pragma solidity ^0.5.0;

/**
    Owner address
 */
contract Ownable {

  address public owner;
//   uint public balance;
  mapping(address => uint) public balance;

  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  constructor() public {
    owner = msg.sender;
    balance[msg.sender] = 100;
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }


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

contract BankAccount is Ownable, Destructible {

  function store() public payable {
      
  } 

//   function withdraw(uint amount) public onlyOwner {
//       if (this.balance >= amount) {
//         msg.sender.transfer(amount);
//       }
//   } 

}
