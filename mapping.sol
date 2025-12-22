// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract Mapping {
    mapping(address => uint256) balances;

    function deposit(address _myAddress, uint256 _deposit) public returns(uint256) {
        balances[_myAddress] += _deposit;
        return balances[_myAddress];
    }

    function withdraw(address _myAddress, uint256 amount) public returns(uint256) {
        if (balances[_myAddress] - amount < 0)
            revert('Not enought founds');
        balances[_myAddress] -= amount;
        return balances[_myAddress];
    }

    function checkBalance(address _myAddress) public view returns(uint256){
        return balances[_myAddress];
    }
}