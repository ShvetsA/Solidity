// ----------------------------------------------------------------------------
 68 // Owned contract
 69 // ----------------------------------------------------------------------------
 70 contract Owned {
 71     address public owner;
 72     address public newOwner;
 73 
 74     event OwnershipTransferred(address indexed _from, address indexed _to);
 75 
 76     function Owned() public {
 77         owner = msg.sender;
 78     }
 79 
 80     modifier onlyOwner {
 81         require(msg.sender == owner);
 82         _;
 83     }
 84 
 85     function transferOwnership(address _newOwner) public onlyOwner {
 86         newOwner = _newOwner;
 87     }
 88     function acceptOwnership() public {
 89         require(msg.sender == newOwner);
 90         OwnershipTransferred(owner, newOwner);
 91         owner = newOwner;
 92         newOwner = address(0);
 93     }
 94 }
 95 