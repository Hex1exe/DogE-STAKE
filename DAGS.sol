// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

    //  ───▄▀▀▀▄▄▄▄▄▄▄▀▀▀▄───
    //  ───█▒▒░░░░░░░░░▒▒█───
    //  ────█░░█░░░░░█░░█────
    //  ─▄▄──█░░░▀█▀░░░█──▄▄─
    //  █░░█─▀▄░░░░░░░▄▀─█░░█
    //  █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
    //  █░░╦─╦╔╗╦─╔╗╔╗╔╦╗╔╗░░█
    //  █░░║║║╠─║─║─║║║║║╠─░░█
    //  █░░╚╩╝╚╝╚╝╚╝╚╝╩─╩╚╝░░█
    //  █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█


//HexBear's Stupid Doge Staking contract 
//All scoops go to stakers
//
// HiberStakeStake your Stupid Doge for more. The Longer you stay, the more you earn.
//
// This contract swaps to and from DogeStakes and Stupid Doge Coin, the HexBear staking tokens.


contract HiberStake is ERC20("DogeStakes", "DAGs"){
    using SafeMath for uint256;
    IERC20 public Doges;
    address public BurnAdd;
    uint256 public beginHiberStake;
    uint256 public initialDogesBalance;


    // Supid Doge token contract

    constructor(IERC20 _Doges) public {
        Doges = _Doges;
    }


    // HiberStake. Pay some Stupid Doges. Earn some Dags.
    // Locks Doges and mints Dags
    function Stake(uint256 _amount) public {
        // Gets the amount of Stupid Doges locked in the contract
        uint256 totalDoges = Doges.balanceOf(address(this));
        // Gets the amount of Dags in existence
        uint256 totalDags = totalSupply();
        // If no Dags exists, they will be minted 1:1
        if (totalDags == 0 || totalDoges == 0) {
            mint(msg.sender, amount);
        } 
        // Calculate and mint the amount of Dags the Stupid Doge is worth. 
        //The ratio will change overtime, as Dags is burned/minted and Stupid Doge is deposited/ withdrawn with scoops.
        else {
            uint256 what = _amount.mul(totalDags).div(totalDoges);
            _mint(msg.sender, what);
        }
        // Lock the Stupid Doge in the contract
        Doges.transferFrom(msg.sender, address(this), _amount);
        beginHiberStake = block.timestamp;
    }
     function check() public  returns (uint256) {
        initialDogesBalance = Doges.balanceOf(address(this));
        uint256 LeaveWith = 0;
        //Stay for 1 day. LeaveWith 95%
        if ((block.timestamp-beginHiberStake)>1 days)
        {LeaveWith = (initialDogesBalance.mul(95)).div(100);

        //Stay for 3 days. LeaveWith 90%
        } if ((block.timestamp-beginHiberStake)>3 days)
        {LeaveWith = (initialDogesBalance.mul(90)).div(100);

        //Stay for 6 days. LeaveWith 85%
        } if ((block.timestamp-beginHiberStake)>6 days)
        {LeaveWith = (initialDogesBalance.mul(85)).div(100);

        //Stay for 8 days. LeaveWith 75%
        } if ((block.timestamp-beginHiberStake)>8 days)
        {LeaveWith = (initialDogesBalance.mul(75)).div(100);

        //Stay for 20 days. LeaveWith 65%
        } if ((block.timestamp-beginHiberStake)>20 days)
        {LeaveWith = (initialDogesBalance.mul(65)).div(100);

        //Stay for 30 days. LeaveWith 25%
        } if ((block.timestamp-beginHiberStake)>30 days)
        {LeaveWith = (initialDogesBalance.mul(25)).div(100);

        //Stay for 50 days. LeaveWith 45%
        } if ((block.timestamp-beginHiberStake)>50 days)
        {LeaveWith = (initialDogesBalance.mul(45)).div(100);

        //Stay for 70 days. LeaveWith 50%
        } if ((block.timestamp-beginHiberStake)>70 days)
        {LeaveWith = (initialDogesBalance.mul(50)).div(100);

        //Stay for 100 days. LeaveWith 60%
        } if ((block.timestamp-beginHiberStake)>100 days)
        {LeaveWith = (initialDogesBalance.mul(60)).div(100);

        //Stay for 150 days. LeaveWith 70%
        } if ((block.timestamp-beginHiberStake)>150 days)
        {LeaveWith = (initialDogesBalance.mul(70)).div(100);

        //Stay for 180s. LeaveWith 75%
        } if ((block.timestamp-beginHiberStake)>180 days)
        {LeaveWith = (initialDogesBalance.mul(75)).div(100);

        //Stay for 250 days. LeaveWith 85%
        } if ((block.timestamp-beginHiberStake)>250 days)
        {LeaveWith = (initialDogesBalance.mul(85)).div(100);

        //Stay for 290 days. LeaveWith 90%
        } if ((block.timestamp-beginHiberStake)>290 days)
        { LeaveWith = (initialDogesBalance.mul(90)).div(100);

        //Stay for 350 days. LeaveWith 95%
        } if ((block.timestamp-beginHiberStake)>350 days)
        {LeaveWith = (initialDogesBalance.mul(95)).div(100);

        //Stay for 450 days. LeaveWith 96%
        } if ((block.timestamp-beginHiberStake)>450 days)
        {LeaveWith = (initialDogesBalance.mul(96)).div(100);

        //Stay for 730 days. LeaveWith 97%
        } if ((block.timestamp-beginHiberStake)>730 days)
        {LeaveWith = (initialDogesBalance.mul(97)).div(100);

        //Stay for 1400 days. LeaveWith 98%
        } if ((block.timestamp-beginHiberStake)>1400 days)
        {LeaveWith = (initialDogesBalance.mul(98)).div(100);

        //Stay for 2800 days. LeaveWith 100%
        } if ((block.timestamp-beginHiberStake)>2800 days)
        {LeaveWith = initialDogesBalance;
        }
        return LeaveWith;       
    }

    // UnStake From HiberStake and claim back your Doges.
    // Unlocks the staked + gained Doges and burns the Dags
    function leave(uint256 _share) public {
        // Gets the amount of Dags in existence
        uint256 totalDags = totalSupply();
        // Calculates the amount of Doges the Dags are worth
        uint256 what = _share.mul(check()).div(totalDags);
        _burn(msg.sender, _share);
        transfer(msg.sender, what);
    }
}
