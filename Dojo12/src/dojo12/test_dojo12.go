package dojo12

import (
	"github.com/orfjackal/gospec/src/gospec"
	. "github.com/orfjackal/gospec/src/gospec"
	"fmt"
)

func MySpec(c gospec.Context) {
	c.Specify("Should return max power of 2 less then value", func() {
			value := 14
			expected := 3
			actual := GetMaxPowerOf2(value)
			c.Expect(actual, Equals, expected)
		})
	c.Specify("Should return sorted array", func() {
			inputArr := []int{3, 6, 1, 2}
			expected := []int{1, 2, 3, 6}
			actual := SortArray(inputArr)
			c.Expect(len(actual), Equals, len(expected))
			for i := 0; i < len(actual); i++ {
				c.Expect(actual[i], Equals, expected[i])
			}
		})

	c.Specify("Should swap elemnts in block", func() {
			inputArr := []int{1, 1, 1, 1, 0, 0, 0, 0}
			fromPos := 1
			toPos := 2
			dist := 4
			blockSize := 8
			offset := 0
			expected := []int{1, 0, 0, 1, 0, 1, 1, 0}
			doSwap(inputArr, fromPos, toPos, dist, blockSize, offset)
			fmt.Println(inputArr)
			for i := 0; i < len(inputArr); i++ {
				c.Expect(inputArr[i], Equals, expected[i])
			}
		})
}


