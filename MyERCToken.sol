pragma solidity ^0.4.15;

contract MyERCToken {
  mapping(address => uint256) balances;
  mapping(address => mapping (address => uint256)) allowed;
  uint256 _totalSupply = 1000000;
  address public owner;
  string public constant symbol = "MYT";
  string public constant name = "This Is ERC20 Token Make By Wingchiu";
  
  function totalSupply() constant returns (uint256 theTotalSupply) {
    theTotalSupply = _totalSupply;
    return theTotalSupply;
  }
  
  function balanceOf(address _owner) constant returns (uint256 balance) {
    return balances[_owner];
  }
  
  function approve(address _spender, uint256 _amount) returns (bool success) {
    allowed[msg.sender][_spender] = _amount;
    Approval(msg.sender, _spender, _amount);
    return true;
  }
  
  function transfer(address _to, uint256 _amount) returns (bool success) {
    if (balances[msg.sender] >= _amount 
      && _amount > 0
      && balances[_to] + _amount > balances[_to]) {
      balances[msg.sender] -= _amount;
      balances[_to] += _amount;
      // Fire a transfer event for any
      // logic that's listening
      Transfer(msg.sender, _to, _amount);
        return true;
      } else {
        return false;
      }
   }
   
   function transferFrom(address _from, address _to, uint256 _amount) returns (bool success) {
    if (balances[_from] >= _amount
      && allowed[_from][msg.sender] >= _amount
      && _amount > 0
      && balances[_to] + _amount > balances[_to]) {
    balances[_from] -= _amount;
    balances[_to] += _amount;
    Transfer(_from, _to, _amount);
      return true;
    } else {
      return false;
    }
  }
  
  function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
    return allowed[_owner][_spender];
  }

  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
}
