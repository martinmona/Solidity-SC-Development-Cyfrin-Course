// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract Mapping {
    address[] accounts;
    mapping(address => uint256) private _balances;
    mapping(address => bool) private _exists;

    function createAccount(address _newAddress) public {
        accounts.push(_newAddress);
        _exists[_newAddress] = true;
    }

    function deposit(address _myAddress, uint256 _deposit) public returns(uint256) {
        _balances[_myAddress] += _deposit;
        require(_exists[_myAddress], 'Account does not exists');
        return _balances[_myAddress];
    }

    function withdraw(address _myAddress, uint256 amount) public returns(uint256) {
        require(_exists[_myAddress], 'Account does not exists');
        require (_balances[_myAddress] - amount < 0, 'Not enough founds');
        _balances[_myAddress] -= amount;
        return _balances[_myAddress];
    }

    function checkBalance(address _myAddress) public view returns(uint256){
        require(_exists[_myAddress], 'Account does not exists');
        return _balances[_myAddress];
    }
}