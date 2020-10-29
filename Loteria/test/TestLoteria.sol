pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Loteria.sol";

contract TestLoteria {
 // The address of the loteria contract to be tested
 Loteria loteria = Loteria(DeployedAddresses.Loteria());

 function testDeposit() public {
  loteria.deposit();
  //notnul = address(this).balance > 0;
  

  //Assert.equal(address(this), adress, "Balance > 0");
}


 //The expected owner of adopted pet is this contract
 address expectedOwner = address(this);

}

