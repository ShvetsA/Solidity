contract ERC20Interface {
 45     function totalSupply() public constant returns (uint);
 46     function balanceOf(address tokenOwner) public constant returns (uint balance);
 47     function allowance(address tokenOwner, address spender) public constant returns (uint remaining);
 48     function transfer(address to, uint tokens) public returns (bool success);
 49     function approve(address spender, uint tokens) public returns (bool success);
 50     function transferFrom(address from, address to, uint tokens) public returns (bool success);
 51 
 52     event Transfer(address indexed from, address indexed to, uint tokens);
 53     event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
 54 }