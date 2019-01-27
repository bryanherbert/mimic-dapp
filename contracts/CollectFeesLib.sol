pragma solidity ^0.5.0;

import "../contracts/StructLib.sol";

library CollectFeesLib {

    function collectFees(StructLib.Data storage self, uint _fundNum, address payable fundOwner)
    public
    returns (uint)
    {
        //Calculate fees
        uint feesCollected = self.list[_fundNum].fees[fundOwner];
        self.list[_fundNum].fees[fundOwner] = 0;
        fundOwner.transfer(feesCollected);
        return feesCollected;
    }
}