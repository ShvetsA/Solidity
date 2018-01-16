pragma solidity ^0.4.0;

contract Calculator {
 uint x = 2;
 uint z;
 uint y;
 address owner;
 
 
 
 function setNum(uint d, uint a) public {
     a = y;
     z = d;
     y = z * x;
 }

  
  function getNum() public constant returns (uint){
     return y;
  }
  
   function kill() public {
      owner = msg.sender;
      if (msg.sender == owner) 
      selfdestruct(owner); 
  }
}