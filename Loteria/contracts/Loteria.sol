pragma solidity ^0.5.0;

contract Loteria{

	address public owner;

	address payable [] public punters;

	constructor() public{
		owner = msg.sender;
	}
	
	modifier OwnerOnly{
		if(msg.sender == owner){
			_;
		}
	}

	function deposit() public payable{
		require(msg.value == 1 ether);
		punters.push(msg.sender);
	}

	function GenerateRandomNum() public view returns(uint){
		return uint(keccak256(abi.encodePacked(now, block.difficulty, punters.length)));

	}

	function pickWinner() OwnerOnly public{
		uint randomNumber = GenerateRandomNum();
		uint index = randomNumber % punters.length;

		address payable winner;

		winner = punters[index];

		winner.transfer(address(this).balance);

		punters = new address payable [](0);
	}
}