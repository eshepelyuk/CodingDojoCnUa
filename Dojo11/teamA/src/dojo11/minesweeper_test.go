package dojo11

import (
	"github.com/orfjackal/gospec/src/gospec"
	. "github.com/orfjackal/gospec/src/gospec"
)

func MySpec(c gospec.Context) {
	c.Specify("should return mines at their positions", func() {
		input := [][]string{{"*", ".", "*"}}
		out := Minesweeper(input)

		c.Expect(out[0][0], Equals, "*")
		c.Expect(out[0][2], Equals, "*")
	})

	c.Specify("should mine counts left and right", func() {
			input := [][]string{{"*", ".", "*", ".", ".", "*", ".", ".",".","*","*"}}
			out := Minesweeper(input)

			c.Expect(out[0][1], Equals, "2")
			c.Expect(out[0][3], Equals, "1")
			c.Expect(out[0][4], Equals, "1")
			c.Expect(out[0][6], Equals, "1")
			c.Expect(out[0][7], Equals, "0")
			c.Expect(out[0][8], Equals, "1")
			c.Expect(out[0][9], Equals, "*")
			c.Expect(out[0][10], Equals, "*")
		})

	c.Specify("should mine counts upp and down", func() {
		input := [][]string{{"*"}, {"."}, {"*"}}
		out := Minesweeper(input)

		c.Expect(out[1][0], Equals, "2")
	})

	c.Specify("should mine counts acceptance1", func() {
			input := [][]string{
				{"*", ".", "."},
				{".", ".", "."},
				{".", ".", "*"},
			}
			out := Minesweeper(input)

			c.Expect(out[1][1], Equals, "2")
		})
	c.Specify("should mine counts acceptance1", func() {
			input := [][]string{
				{".", ".", "*"},
				{".", ".", "."},
				{"*", ".", "."},
			}
			out := Minesweeper(input)

			c.Expect(out[1][1], Equals, "2")
		})

	c.Specify("should mine counts acceptance1", func() {
			input := [][]string{
				{"*", "*", ".", ".", "."},
				{".", ".", ".", ".", "."},
				{".", "*", ".", ".", "."},
			}
			out := Minesweeper(input)

			c.Expect(out[1][0], Equals, "3")
			c.Expect(out[1][1], Equals, "3")
			c.Expect(out[1][2], Equals, "2")
			c.Expect(out[1][3], Equals, "0")
			c.Expect(out[1][4], Equals, "0")
		})

	c.Specify("should mine counts acceptance1", func() {
			input := [][]string{
				{"*", ".", ".", "."},
				{".", ".", ".", "."},
				{".", "*", ".", "."},
				{".", ".", ".", "."},
			}
			out := Minesweeper(input)

			c.Expect(out[1][0], Equals, "2")
			c.Expect(out[1][1], Equals, "2")
			c.Expect(out[1][2], Equals, "1")
			c.Expect(out[1][3], Equals, "0")
		})

	c.Specify("should mine counts acceptance1", func() {
			input := [][]string{
				{"*", "."},
				{".", ".", ".", "."},
				{".", "*", "."},
				{".", },
			}
			out := Minesweeper(input)

			c.Expect(len(out[0]), Equals, 4)
			c.Expect(len(out[1]), Equals, 4)
			c.Expect(len(out[2]), Equals, 4)
			c.Expect(len(out[3]), Equals, 4)
		})
}


