// Advent of Code 2025 Day 4 Part 2
// Author: Immabed
// Date: December 4, 2025

// Optimized algorithm.
// Thanks to Bill O'D for the idea to pad the matrix with zeroes to avoid edge detection
// Thanks to nforrester for the idea to track which elements need to be rechecked after a removal,
// which led me to my recursion solution.

const fs = require('node:fs');

fs.readFile('input', 'utf8', (err, data) => {
    if (err) {
	console.error(err);
	return;
    }
    let paperMatrix = [];
    data.trim().split("\n").forEach((row) => paperMatrix.push([0].concat(row.split('').map((element) => element == "@" ? 1 : 0), [0])));
    paperMatrix = [paperMatrix[0].map((x) => 0)].concat(paperMatrix, [paperMatrix[0].map((x) => 0)]);
    console.log(countAndRemoveAccessible(paperMatrix));
});

// Recursive function, when a paper roll is removed, call on all adjacent paper rolls.
function removeIfAccessible(matrix, i, j) {
    // Ignore edges
    if (
        matrix[i-1][j-1] +
        matrix[i-1][j]   +
        matrix[i-1][j+1] +
        matrix[i][j-1]   +
        matrix[i][j+1]   +
        matrix[i+1][j-1] +
        matrix[i+1][j]   +
        matrix[i+1][j+1] < 4
    ) {
        matrix[i][j] = 0;
        let sum = 1; 
        for (let m = i - 1; m <= i + 1; m++) {
            for (let n = j - 1; n <= j + 1; n++) {
                if (matrix[m][n] == 0) { continue; } // Pre-check to avoid unnecessary recursion
                sum += removeIfAccessible(matrix, m, n);
            }
        }
        return sum;
    }
    else {
        return 0;
    }
}
    
// Check entire grid once. There may be a better way to do this to account for where the recursive algorithm has already been.
// But, this ensures every paper roll is checked.
function countAndRemoveAccessible(matrix) {
    let sum = 0;
    for (let i = 1; i < matrix.length - 1; i++) {
	for (let j = 1; j < matrix[i].length - 1; j++) {
	    if (matrix[i][j] == 0) { continue; } // Pre-check to avoid unnecessary function calls
            sum += removeIfAccessible(matrix, i, j);
	}
    }
    return sum;
}

