// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import { Cow } from "./Cow.sol";
import { Bird } from "./Bird.sol";

contract AnimalFactory {
    Cow[] public CowsContracts;
    Bird[] public BirdContracts;
    enum AnimalType { Cow, Bird }

    function createAnimals(AnimalType _animalType, string memory _name) public {
        if (_animalType == AnimalType.Cow) {
            Cow newCow = new Cow(_name);
            CowsContracts.push(newCow);
        }
        if (_animalType == AnimalType.Bird) {
            Bird newBird = new Bird(_name);
            BirdContracts.push(newBird);
        }
    }

    function getAnimalName(AnimalType _type, uint256 index) view public returns (string memory) {
        if (_type == AnimalType.Cow) {
            return CowsContracts[index].getName();
        }
        if (_type == AnimalType.Bird) {
            return BirdContracts[index].getName();
        }
        return "Not Found";
    }
}