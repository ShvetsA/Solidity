pragma solidity ^0.4.0;

contract Calculator {
 uint x = 2;
 uint z;
 uint y;
 address owner;
    
    function owned() {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }
   
    function setNum(uint d, uint a) public constant onlyOwner {
     a = y;
     z = d;
     y = z * x;
 }

  function getNum() public constant onlyOwner  returns (uint){
     return y;
  }
  
   function kill() public {
      if (msg.sender == owner) 
      selfdestruct(owner); 
  }
}