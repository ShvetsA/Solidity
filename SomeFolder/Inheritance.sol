pragma solidity ^0.4.19;


contract Parent{
    int x = 10;
}

contract Child is Parent {
    function getParent() public constant returns (int){
        return x;
    }
} 