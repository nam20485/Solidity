pragma solidity ^0.4.0;

contract Coin {
    // The keyword "public" makes those variables
    // readable from outside.
    address public minter;
    mapping (address => uint) public balances;

    // Events allow light clients to react on
    // changes efficiently.
    event Sent(address from, address to, uint amount);

    // This is the constructor whose code is
    // run only when the contract is created.
    function Coin() {
        minter = msg.sender;
    }

    function createCoin(address receiver, uint amount) {
        if (msg.sender == minter)   {
            balances[receiver] += amount;
        }
    }

    function sendCoin(address receiver, uint amount) {
        if (balances[msg.sender] >= amount) {
            balances[msg.sender] -= amount;
            balances[receiver] += amount;
            Sent(msg.sender, receiver, amount);
        }
    }
}