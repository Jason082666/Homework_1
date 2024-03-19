// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Problem 1 Interface & Contract */
contract StudentV1 {
    // Note: You can declare some state variable
    uint256 public registerValue;

    constructor() {
        registerValue = 1000; 
    }

    function register() external returns (uint256) {
        // TODO: please add your implementaiton here
        uint256 returnValue = registerValue;
        registerValue = 123; 
        return returnValue;
    }
}

/* Problem 2 Interface & Contract */
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    IClassroomV2 public classroom;

    constructor(address _classroomAddress) {
        classroom = IClassroomV2(_classroomAddress);
    }

    function register() external view returns (uint256) {
        if (classroom.isEnrolled()) {
            return 123;
        } else {
            return 1000;
        }
    }
}


/* Problem 3 Interface & Contract */

contract StudentV3 {
    function register() external view returns (uint256) {
        return 1000;
    }
}