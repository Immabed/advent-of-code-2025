// Advent of Code 2025 Day 3 Part 1
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
    const digit1index = findMaxIndex(bankArray.slice(0,-1));
    const digit2index = findMaxIndex(bankArray.slice(digit1index + 1)) + digit1index + 1;
    const maxJoltage = 10 * bankArray[digit1index] + bankArray[digit2index];
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
