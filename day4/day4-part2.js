// Advent of Code 2025 Day 4 Part 2
// Author: Immabed
// Date: December 4, 2025

const fs = require('node:fs');

fs.readFile('input', 'utf8', (err, data) => {
    if (err) {
	console.error(err);
	return;
    }
    let paperMatrix = [];
    data.trim().split("\n").forEach((row) => paperMatrix.push(row.split('').map((element) => element == "@" ? 1 : 0)));
    let sum = 0;
    let sumPart = 0;
    do {
	sumPart = countAndRemoveAccessible(paperMatrix);
	sum += sumPart;
    } while (sumPart > 0);
    
    console.log(sum);
});

function countAndRemoveAccessible(matrix) {
    let sum = 0;
    const matrixCopy = matrix.map((row) => row.slice());
    const h = matrixCopy.length - 1;
    for (let i = 0; i <= h; i++) {
	const l = matrixCopy[i].length - 1;
	for (let j = 0; j <= l; j++) {
	    if (matrixCopy[i][j] == 0) { continue; }
	    if (    
		((i > 0 && j > 0) ? matrixCopy[i-1][j-1] : 0) +
		((i > 0) 	  ? matrixCopy[i-1][j]   : 0) +
		((i > 0 && j < l) ? matrixCopy[i-1][j+1] : 0) +
		((         j > 0) ? matrixCopy[i][j-1]   : 0) +
		((         j < l) ? matrixCopy[i][j+1]   : 0) +
		((i < h && j > 0) ? matrixCopy[i+1][j-1] : 0) +
		((i < h         ) ? matrixCopy[i+1][j]   : 0) +
		((i < h && j < l) ? matrixCopy[i+1][j+1] : 0) < 4
	    ) {
		sum++;
		matrix[i][j] = 0;
	    }
	}
    }
    return sum;
}

