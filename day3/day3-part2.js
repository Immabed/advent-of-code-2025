// Advent of Code 2025 Day 3 Part 2
// Author: Immabed
// Date: December 3, 2025

const fs = require('node:fs');

fs.readFile('input', 'utf8', (err, data) => {
    if (err) {
	console.error(err);
	return;
    }
    const banks = data.split("\n");
    console.log(sumBankJoltage(banks));
});

function sumBankJoltage(banks) {
    let sum = 0;
    for (var i = 0; i < banks.length; i+=1) {
	sum += maximizeBankJoltage(banks[i]);
    }
    return sum;
}

function maximizeBankJoltage(bank) {
    if (bank.length == 0) {return 0;}
    const bankArray = bank.split('').map(Number);
    let digitIndices = [findMaxIndex(bankArray.slice(0,-11))];
    let maxJoltage = bankArray[digitIndices[0]];
    for (let digit = 1; digit < 12; digit+=1) {
	if (digit != 11) { // I was stuck on this forever, turns out -0 as the end of a slice gives an empty slice, not one to the end :P	
	    digitIndices[digit] = findMaxIndex(bankArray.slice(digitIndices[digit-1] + 1, - (11 - digit))) + digitIndices[digit-1] + 1;
	}
	else {
	    digitIndices[digit] = findMaxIndex(bankArray.slice(digitIndices[digit-1] + 1)) + digitIndices[digit-1] + 1;
	}
	maxJoltage = maxJoltage * 10 + bankArray[digitIndices[digit]];
    }
    return maxJoltage;
}
    

function findMaxIndex(digitArray) {
    max = 0;
    for (let i = 0; i < digitArray.length; i+=1) {
	if (digitArray[i] == 9) {
	    return i;
	}
	else if (digitArray[i] > digitArray[max]) {
	    max = i;
	}
    }
    return max
}
