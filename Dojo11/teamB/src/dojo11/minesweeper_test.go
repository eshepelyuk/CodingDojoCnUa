package dojo11

import (
	"github.com/orfjackal/gospec/src/gospec"
	. "github.com/orfjackal/gospec/src/gospec"
)

func MySpec(c gospec.Context) {

	field := [][]rune {
		{'*', '.', '.', '.'},
		{'.', '.', '.', '.'},
		{'.', '*', '.', '.'},
		{'.', '.', '.', '.'}}

	field2 := [][]rune {
		{'*', '*', '.', '.', '.'},
		{'.', '.', '.', '.', '.'},
		{'.', '*', '.', '.', '.'}}

	c.Specify("minesweeper() return array with the same size", func() {
			result := minesweeper(field)

			c.Expect(len(result), Equals, 4)
			c.Expect(len(result[0]), Equals, 4)
		})
	c.Specify("check symbol replace asterics by -1 value", func() {
			result := minesweeper(field)
			c.Expect(result[0][0], Equals, -1)
			c.Expect(result[2][1], Equals, -1)
		})
	c.Specify("check mine count in column", func() {
			inField := [][]rune {
				{'.', '*', '.', '.'}}
			expectedField := [][]int {
				{1, -1, 1, 0}}
			actualField := minesweeper(inField)
			c.Expect(actualField[0][0], Equals, expectedField[0][0])
			c.Expect(actualField[0][1], Equals, expectedField[0][1])
			c.Expect(actualField[0][2], Equals, expectedField[0][2])
			c.Expect(actualField[0][3], Equals, expectedField[0][3])

		})
	c.Specify("check mine count in row", func() {
			inField := [][]rune {
				{'.'},
				{'*'},
				{'.'},
				{'.'}}

			expectedField := [][]int {
				{1},
				{-1},
				{1},
				{0}}

			actualField := minesweeper(inField)
			c.Expect(actualField[0][0], Equals, expectedField[0][0])
			c.Expect(actualField[1][0], Equals, expectedField[1][0])
			c.Expect(actualField[2][0], Equals, expectedField[2][0])
			c.Expect(actualField[3][0], Equals, expectedField[3][0])

		})
	c.Specify("check mine count in cross", func() {
			inField := [][]rune {
				{'.', '.', '.', '.'},
				{'.', '.', '.', '.'},
				{'.', '*', '.', '.'},
				{'.', '.', '.', '.'}}

			expectedField := [][]int {
				{0, 0, 0, 0},
				{1, 0, 1, 0},
				{0, -1, 0, 0},
				{1, 0, 1, 0}}
			actualField := minesweeper(inField)
			c.Expect(actualField[1][0], Equals, expectedField[1][0])
			c.Expect(actualField[1][2], Equals, expectedField[1][2])
			c.Expect(actualField[3][2], Equals, expectedField[3][2])
			c.Expect(actualField[3][0], Equals, expectedField[3][0])
		})

	c.Specify("integration test N1", func() {
			expectedField := [][]int{
				{-1, 1, 0, 0},
				{2, 2, 1, 0},
				{1, -1, 1, 0},
				{1, 1, 1, 0}}
			actualField := minesweeper(field)
			for i := 0; i < len(field); i++ {
				for j := 0; j < len(field[i]); j++ {
					c.Expect(actualField[i][j], Equals, expectedField[i][j])
				}
			}
		})

	c.Specify("integration test N2", func() {
			expectedField := [][]int{
				{-1, -1, 1, 0, 0},
				{3, 3, 2, 0, 0},
				{1, -1, 1, 0, 0}}
			actualField := minesweeper(field2)
			for i := 0; i < len(field2); i++ {
				for j := 0; j < len(field2[i]); j++ {
					c.Expect(actualField[i][j], Equals, expectedField[i][j])
				}
			}
		})

}
