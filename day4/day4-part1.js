// Advent of Code 2025 Day 4 Part 1
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
    console.log(countAccessible(paperMatrix));
});

function countAccessible(matrix) {
    let sum = 0;
    const h = matrix.length - 1;
    for (let i = 0; i <= h; i++) {
	const l = matrix[i].length - 1;
	for (let j = 0; j <= l; j++) {
	    if (matrix[i][j] == 0) { continue; }
	    if (    
		((i > 0 && j > 0) ? matrix[i-1][j-1] : 0) +
		((i > 0) 	  ? matrix[i-1][j]   : 0) +
		((i > 0 && j < l) ? matrix[i-1][j+1] : 0) +
		((         j > 0) ? matrix[i][j-1]   : 0) +
		((         j < l) ? matrix[i][j+1]   : 0) +
		((i < h && j > 0) ? matrix[i+1][j-1] : 0) +
		((i < h         ) ? matrix[i+1][j]   : 0) +
		((i < h && j < l) ? matrix[i+1][j+1] : 0) < 4
	    ) {
		sum++;
	    }
	}
    }
    return sum;
}

