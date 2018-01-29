pragma solidity ^0.4.16;



contract WhoIsTolik{
    
    uint Tolik;
    function ImTheTolik(uint a) public constant returns (bool) {
        Tolik = a;
        if (Tolik <= 0)
        return true;
        else 
        return false;
        
        
    } 
}