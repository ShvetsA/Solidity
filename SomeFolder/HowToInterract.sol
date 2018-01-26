pragma solidity ^0.4.19;

contract Foo {
    
    Calculator calc = Calculator(0x2b47f0d926a28adfc90a69939502dcb687ac3686);
    
    function twoTimesThree() public constant returns(int){
        return calc.multiply(0,0);
    }
    function onePlusSeven() public constant returns(int) {
        return calc.add(0, 0);
    }
}

contract Calculator {
    
    function multiply(int a, int b) public returns (int) {
          return a * b;
    }
          
    function add(int a, int b) public returns (int){
        return  a + b;
        
        
    }
}