pragma solidity ^0.4.18;

contract ApprovalContract {
    address public sender;
    address public receiver;
    address public constant approver = 0xC5Fdf4076b8f3a5357C5e375AB970b5B54098feF;

    function deposit(address _receiver) external payable {
        require(msg.value > 0);
        sender = msg.sender;
        receiver = _receiver;
    }

    function viewApprover() external pure returns(address) {
        return(approver);
    }

    function approve() external {
        require(msg.sender == approver);
        receiver.transfer(address(this).balance);
    }
}