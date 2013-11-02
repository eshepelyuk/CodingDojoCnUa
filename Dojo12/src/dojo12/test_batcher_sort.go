package dojo12

import (
	"github.com/orfjackal/gospec/src/gospec"
	. "github.com/orfjackal/gospec/src/gospec"
	. "dojo12/server"
)

func BatcherSortSpec(c gospec.Context) {
	c.Specify("Should return max power of 2 less then value", func() {
			value := 14
			expected := 3
			actual := GetMaxPowerOf2(value)
			c.Expect(actual, Equals, expected)
		})

	c.Specify("Should return sorted array", func() {
			inputArr := []int{3, 6, 1, 2}
			expected := []int{1, 2, 3, 6}
			inputChannel := make(chan [] int, 4)
			inputChannel <- inputArr

			actualChan := SortArray(inputChannel)
			actual := <- actualChan

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
			DoSwap(inputArr, fromPos, toPos, dist, blockSize, offset)
			for i := 0; i < len(inputArr); i++ {
				c.Expect(inputArr[i], Equals, expected[i])
			}
		})

	c.Specify("Should divide input array into tasks", func() {
			inputArr := []int{1, 2, 3, 4, 5, 6, 7}
			tasksCount := 3
			expResult := [][]int {{5, 6, 7}, {2, 3, 4}, {0, 1}}
			actResult := DivideArrayOnTasks(inputArr, tasksCount)
			c.Expect(actResult[0], ContainsAny, expResult[0])
			c.Expect(actResult[1], ContainsAny, expResult[1])
			c.Expect(actResult[2], ContainsAny, expResult[2])
		})
}


