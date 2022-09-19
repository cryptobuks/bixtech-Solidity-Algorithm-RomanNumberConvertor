// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract romanNumberConvertor{
     mapping (uint256 => uint256) mapOfNumber;
     mapping (uint256 => string) convertLibrary;
     string public result;
    constructor() {
        convertLibrary[1] = "I";
        convertLibrary[2] = "II";
        convertLibrary[3] = "III";
        convertLibrary[4] = "IV";
        convertLibrary[5] = "V";
        convertLibrary[6] = "VI";
        convertLibrary[7] = "VII";
        convertLibrary[8] = "VIII";
        convertLibrary[9] = "IX";
        convertLibrary[10] = "X";
        convertLibrary[20] = "XX";
        convertLibrary[30] = "XXX";
        convertLibrary[40] = "XL";
        convertLibrary[50] = "L";
        convertLibrary[60] = "LX";
        convertLibrary[70] = "LXX";
        convertLibrary[80] = "LXXX";
        convertLibrary[90] = "XC";
        convertLibrary[100] = "C";
        convertLibrary[200] = "CC";
        convertLibrary[300] = "CCC";
        convertLibrary[400] = "CI";
        convertLibrary[500] = "I";
        convertLibrary[600] = "IC";
        convertLibrary[700] = "ICC";
        convertLibrary[800] = "ICCC";
        convertLibrary[900] = "CM";
        convertLibrary[1000] = "M";
        convertLibrary[2000] = "MM";
        convertLibrary[3000] = "MMM";
    }

    function getDigits(uint256 number) private pure returns (uint8) {
        uint8 digits = 0;
        //if (number < 0) digits = 1; // enable this line if '-' counts as a digit
        while (number != 0) {
            number /= 10;
            digits++;
            }
            return digits;
            }
    
    function listOfNumbers(uint256 number, uint8 numberDigits) private  {
        uint256 i = numberDigits;
        while (i != 0){
            uint256 diviveDigits = 10**(numberDigits-1);
            uint256 numbers = (number / diviveDigits) * diviveDigits;
            number -= numbers;
            mapOfNumber[i] = numbers;
            numberDigits -= 1;
            i -= 1;
            }
     
            }



    function main(uint256 normalNumber) public returns(string memory) {
        
        uint8 digits = getDigits(normalNumber);
        listOfNumbers(normalNumber,digits);
        while (digits != 0){
            result = string.concat(result,convertLibrary[mapOfNumber[digits]]);
            digits -= 1;
        }
        return result;


    }

    function clear() public {
        delete result;
    }

}




//NOTE: 
//+ cannot reset mapping (mapOfNumber), take of too much byte
//+ take too much gas
//+output cannot go above 5000;
// mainContract needed to seperate from files
// mainFunction Do Not Return String OutPut Directly.