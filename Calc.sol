pragma solidity ^0.4.0;



contract Calculator {
 uint x = 2;
 uint z;
 
 
 function setNum(uint d) public {
     z = d;
 }

  
  function getNum(uint) public constant returns (uint){
      uint y = z * x;
       return y;
  }
 
}