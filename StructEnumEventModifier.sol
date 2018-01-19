pragma solidity ^0.4.18;

contract Company {
    
    //На данном примере я показал что такое "struct" и в каких целях
    //его можно использовать:
    struct Client {
        string birthdate;
        string firstname;
        string lastname;
         
        
    }
    mapping (address => Client) clients;
    address[] public clientsAccounts;
    address owner;
    
    //На данном примере я показал что такое "modifier" и в каких целях
    //его можно использовать:
    function Company() public{
    owner = msg.sender;
}
   //На данном примере я показал что такое "modifier" и в каких целях
    //его можно использовать:
    modifier onlyOwner{
        require(owner == msg.sender);
        _;
        
    }
    //На данном примере я показал что такое "event" и в каких целях
    //его можно использовать:
    event Log (string _msg, string _firstname, string _lastname, string _birthdate, address _sender);
    
    function setNewClient(address _address, string _firstname, string _lastname, string _birthdate) onlyOwner public {
        var client = clients[_address];
        
        client.birthdate = _birthdate;
        client.firstname = _firstname;
        client.lastname = _lastname;
        
        clientsAccounts.push(_address) -1;
         //На данном примере я показал что такое "event" и в каких целях
        //его можно использовать:
        Log ("ClientAdded", _firstname, _lastname, _birthdate, _address);
     }
    //Кол-во аккаунтов в базе
    function getClients() view public returns(address[]) {
        return clientsAccounts;
    }
    //Открыть личное дело по адресу аккаунта
    function getClient(address _address) view public returns (string, string, string) {
        return (clients[_address].birthdate, clients[_address].firstname, clients[_address].lastname);
    }
    //Удаление клиента из базы
    function removeClient(address _adres) onlyOwner public {
                
                delete(clients[_adres].birthdate);
                delete(clients[_adres].firstname);
                delete(clients[_adres].lastname);
                delete(clients[_adres]);
                clientsAccounts.length --;
     }
        
    
    //Кол-во клиентов в базе
    function countClient() view  public returns (uint) {
        return clientsAccounts.length;
    }
    
    //что такое enum: в моем понимании "enum" - это некий класс хранящий в себе значения
    //Которые расделяются дальше на подзначения.
    //
    //На пример сайт в котором "enum" используется для распределения прав доступа 
    //Админ, Модератор, Пользователь. Которые в свою очередь расделяются на права и возможности
    //В зависимости от статуса "Админ", "Модератор", "Пользователь".
    // 
    //Сегодня мне времени не хватило что бы отобразить возможности "enum" в коде.
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices  choice;
    ActionChoices defaultChoice = ActionChoices.GoStraight;
    
    function setGoStraight() 
    {
        
        
        choice = ActionChoices.GoStraight;
    }

    function getChoice() returns (ActionChoices)
    {
        return choice;
    }
    function getDefaultChoice() returns (uint)
    {
        return uint(defaultChoice);
    }
    
    
}