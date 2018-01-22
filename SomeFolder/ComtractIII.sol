pragma solidity ^0.4.19;

/*
Contract 1
У компании есть клиенты, они могут вызывать функцию в контракте, чтобы инициализироваться
Всего есть 3 уровня доступа (или 3 группы) среди клиентов: которые отправили в контракт 1 эфир, 10 и 20 эфиров.
Когда клиенты компании отправляют в контракт деньги, 5% от суммы идет на адрес собственника контракта
Соответственно своей группе, клиент может запросить стоимость товара для него (6,4,2 эфира соответственно).
Клиенты могут отправлять деньги в контракт и покапа

*/

/* 
Для того что бы внести клиента в базу нужно в поле setNewClient ввести: "addrress", "имя", "фамилия", "дата рождения".
Для того что бы клиенту инициализироваться нужно ввести свой "addrress" в поле "getClient".
Для того что бы клиенту узнать свой "address" в базе нужно ввести ключ(порядковый номер личного дела в базе начиная с 0)
Для того что бы запросить стоимость товара для клиента - вызвать функцию "showMyPrice".



*/

contract Company{
   
    struct Client {
        string birthdate;
        string firstname;
        string lastname;
         }
    mapping (address => Client) clients;
    address[] public clientsAccounts;
    address owner;
    
    
    function Company() public{
    owner = msg.sender;
}
   function setNewClient(address _address, string _firstname, string _lastname, string _birthdate) public {
        var client = clients[_address];
        
        client.birthdate = _birthdate;
        client.firstname = _firstname;
        client.lastname = _lastname;
        clientsAccounts.push(_address) -1;
         }

   
    function getClient(address _address) view public returns (string, string, string) {
        return (clients[_address].birthdate, clients[_address].firstname, clients[_address].lastname);
    }
    
    enum Price { zero, one, two, three, four, five, six }
    Price  choice;
   
    //Price defaultChoice = Price.three;
    
    string a = "Price: ";
    function setStatus() public payable
    {
        if (msg.value == 1 ether){
            choice = Price.two;
            }
        else if (msg.value == 10 ether){
            choice = Price.four;
        }
        if (msg.value == 20 ether) {
            choice = Price.six;
        }
        uint b = msg.value / 20;
        owner.transfer(b);
    }
        
    function showMyPrice()public constant returns (string, Price) {
       
       return ("Your price is: ", choice); 
    } 
}