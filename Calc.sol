pragma solidity ^0.4.0;

contract Calculator {
 uint x = 2;
 uint z;
 uint y;
 address owner;
    
    function Calculator() {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }
   
    function setNum(uint d, uint a)  onlyOwner {
     a = y;
     z = d;
     y = z * x;
 }

  function getNum() constant onlyOwner  returns (uint){
     return y;
  }
  
   function kill() onlyOwner{
     selfdestruct(owner); 
  }
}
