// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

import { Cow } from "./Cow.sol";
import { Bird } from "./Bird.sol";
import { Animal } from "./Animal.sol";

contract AnimalFactory {
    Animal[] public AnimalsContracts;
    enum AnimalType { Cow, Bird }

    function createAnimals(AnimalType _animalType, string memory _name) public {
        if (_animalType == AnimalType.Cow) {
            Cow newCow = new Cow(_name);
            AnimalsContracts.push(newCow);
        }
        if (_animalType == AnimalType.Bird) {
            Bird newBird = new Bird(_name);
            AnimalsContracts.push(newBird);
        }
    }

    function getAnimalName(uint256 index) view public returns (string memory) {
        return AnimalsContracts[index].getName();
    }

    function emitSound(uint256 index) public view returns(string memory) {
        return AnimalsContracts[index].emitSound();
    }
}