
pragma solidity ^0.4.19;

/*
В примере показана разница между .call .delegatecall и вызовом библиотеки с помощью оператора точка - ".";
1. Деплоим контракт "SomeContract" копируем его адррес в буфер обмена. 
2. Деплоим контракт "ThatCallsSomeContract" и вводим ранее скопированный адресс в поле "_contractAddress".
3. Наблюдаем адресса контрактов из которых можно сделать вывод: Если "ThatCallsSomeContract" вызывает "SomeContract" 
через .call то msg.sender будет "SomeContract". Если "ThatCallsSomeContract" вызывает "SomeContract" через .delegatecall то
msg.sender будет "ThatCallsSomeContract".

*/

contract SomeContract {
  event callMeMaybeEvent(address _from);
  function callMeMaybe() payable public {
      callMeMaybeEvent(this);
  }
}
    

contract ThatCallsSomeContract {
    function callTheOtherContract(address _contractAddress) public {
        require(_contractAddress.call(bytes4(keccak256("callMeMaybe()"))));
        require(_contractAddress.delegatecall(bytes4(keccak256("callMeMaybe()"))));
        SomeLib.calledSomeLibFun();
    }
}
    library SomeLib{
    event calledSomeLib(address _from);
    function calledSomeLibFun() public {
        calledSomeLib(this);
    }
}




