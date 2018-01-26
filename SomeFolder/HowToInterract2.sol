
pragma solidity ^0.4.19;

contract Foo {
    
    Calculator calc = new Calculator();
    
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