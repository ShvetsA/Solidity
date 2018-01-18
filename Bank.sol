pragma solidity ^0.4.0;


contract Bank{

//Депозит       Снятие          
address a;      address k;      
address b;      address j;      
                address l; 
address owner;

mapping (address => uint8) more;
event Log (string _msg, address _sender, uint _amount);

function Bank() public{
    owner = msg.sender;
}

modifier onlyOwner {
    require(owner == msg.sender);
        _;
}
// Пополнения баланса доступно только 2 адресам (задаются owner-ом)
function setAllowed(address _a, address _b) onlyOwner public {
       a = _a;
       b = _b;
}
// Просмотреть доступные для пополнения адреса
function showAllowed() public constant returns (address, address) {
       return (a, b);
}
// Логика: если введенный аддресс "x" является одним из доверенных аддрессов происходит зачисление
function depositBalance(address x, uint amt) public onlyOwner payable returns(string) {
        if (x == a) {
            x.transfer(amt);
            more[x] += 1;
            Log("money deposit", msg.sender, msg.value);
            
            } else if (x == b) {
            x.transfer(amt);
            more[x] += 1;
            Log("money deposit", msg.sender, msg.value);
            
            } if (more[x] >= 2) {
            return ("Thanks");
        }
}
//Потратить средства можно только на 3 адреса (задаются owner-ом)
function setWithDrow(address _j, address _k, address _l ) onlyOwner public {
       j = _j;
       k = _k;
       l = _l;
    
}        
//Просмотреть доступные для перевода адреса
function showWithDrow() public constant returns (address, address, address) {
       return (j, k, l);
   }
// Логика: если введенный аддресс "m" является одним из доверенных аддрессов происходит перевод
function WithDrow(address m, uint u) public onlyOwner payable returns (string) {
      if (m == j) {
            m.transfer(u);
        } 
       else if (m == k) {
            m.transfer(u);
        } 
        if (m == l) {
            m.transfer(u);
        }
        else
            return "Forbidden";
}
function fallBack() public payable {} 
  

function showBalance() public onlyOwner constant returns(uint) {
    return this.balance;
}

function arase() internal onlyOwner {
      selfdestruct(owner); 
  }
}