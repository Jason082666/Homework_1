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
// 由於 constructor 沒辦法帶入參數，只好先直接觀察 studentV2 地址，並且把他直接寫進程式碼當中。
interface IClassroomV2 {
    function isEnrolled() external view returns (bool);
}

contract StudentV2 {
    address constant classroomAddress = 0x2e234DAe75C793f67A35089C9d99245E1C58470b; 
    IClassroomV2 classroom = IClassroomV2(classroomAddress);

    function register() external view returns (uint256) {
        if (classroom.isEnrolled()) {
            return 123;
        } else {
            return 1000;
        }
    }
}


/* Problem 3 Interface & Contract */
// 利用 gasleft 去做判段，先去觀察一次消耗的 gas 臨界點。
contract StudentV3 {
    function register() external view returns (uint256) {
       if (gasleft() > 6650) {
        return gasleft();
       } else {
        return 123;
       }
    }
}