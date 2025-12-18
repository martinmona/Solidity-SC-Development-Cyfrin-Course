// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    // uint256[] listOfFavoriteNumbers;

    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    Person[] public listOfPeople;

    Person public pochi = Person({favoriteNumber: 7, name: "pochi"});

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_name, _favoriteNumber));
    }
}