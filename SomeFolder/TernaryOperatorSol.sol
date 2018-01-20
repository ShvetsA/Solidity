pragma solidity ^0.4.19;
/*
Вы отправляете в контракт сумму денег, получаете в ответ столько же токенок 
(просто цифру такую же в ответ отправляете). 
Отправлять могу все, но при повторной отправке денег 
(если человек уже отправлял, ему пишем: "Thanks for staying with us", при первой отправке "Thanks". 
При пополнении баланса контакта создаем ивент с суммой, адресом отправителя.
Функция уничтожения, проверки баланса контракта и меседж сендера

*/
//variable = condition ? expr1 : expr2;
contract ClassWork{
    
    mapping (address => uint8) deposit;
    string a = "Thanks for staying with us" ;
    string b = "Thanks";
    event Log (uint _value, address _address);
    
   function getMoney() public payable {
         
         deposit[msg.sender] ++;
         Log (msg.value, msg.sender);
}

    function getFeedback()  public constant returns (uint, string){
          
         var x =  deposit[msg.sender] >= 2 ?  a : b;
         return (this.balance,x);
    }
             
   function showBalance() public constant returns(uint, address) {
    return (this.balance, msg.sender);
} 
   function kill() public {
       selfdestruct(msg.sender);
   }
  }