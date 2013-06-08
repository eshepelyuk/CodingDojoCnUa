package server

import (
	"math"
	//"fmt"
)

func Dojo12() int {
	return 1
}

func GetMaxPowerOf2(val int) int {
	return int(math.Log2(float64(val)))
}

func DoSwap(arr[]int, fromPos int, toPos int, dist int, blockSize int, offset int) {
	for i := fromPos; i <= toPos; i++ {
		//		fmt.Println("step ", i)
		if (i & blockSize) == offset {
			//			fmt.Println("Condition", i & blockSize, offset)
			//			fmt.Println("Counter", i)
			//			fmt.Println("Dist nelem", i + dist)
			//			fmt.Println("Arr[i]", arr[i])
			//			fmt.Println("Arr[i + dist]", arr[i + dist])
			if arr[i] > arr[i + dist] {
				//				fmt.Print("Hello from" + string(i))
				//						fmt.Println("X")
				arr[i] = arr[i] + arr[i + dist]
				arr[i + dist] = arr[i] - arr[i + dist]
				arr[i] = arr[i] - arr[i + dist]
			}
		}
	}
}

func SortArray(inputChannel chan [] int) chan [] int {
	inputArr := <-inputChannel
	lenArr := len(inputArr)

	t := GetMaxPowerOf2(lenArr)
	x := int(math.Pow(2.0, float64(t)))


	for p := x; p > 0 ; p/=2 {
		dist := p
		r := 0
		for q := x; q >= p ; q/=2 {


			DoSwap(inputArr, 0, lenArr - dist - 1, dist, p, r)

			dist = q - p
			r = p
		}
	}
	outputChan := make(chan [] int, lenArr)
	outputChan <- inputArr
	return outputChan
}

func DivideArrayOnTasks(inputArr[] int, tasksCount int) [][]int {
	var result [][] int
	i := 0
	result = make([][]int, tasksCount)
	start := 0
	var L = len(inputArr)
	for i = tasksCount; i > 0; i-- {
		sizeOfTask := L/i
		L = L - sizeOfTask
		end := start + sizeOfTask
		result[i - 1] = inputArr[start: end]
		start = end
	}
	return result
}
