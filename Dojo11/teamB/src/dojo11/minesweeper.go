package dojo11

func minesweeper(field [][]rune) ([][]int) {
	row_len := len(field)
	col_len := len(field[0])

	a := create(row_len, col_len)
	initArrayAsteriskAsMinusOne(field, a)

	sumByRows(a)
	sumByCols(a)
	sumByCross(a)
	return a
}

func create(row_len, col_len int) ([][]int) {
	a := make([][]int, row_len)
	for i := 0; i < row_len; i++ {
		a[i] = make([]int, col_len)
	}
	return a
}

func initArrayAsteriskAsMinusOne(field [][]rune, resArr[][]int) {
	for i := 0; i < len(field); i++ {
		for j := 0; j < len(field[i]); j++ {
			if '*' == field[i][j] {
				resArr[i][j] = -1
			}
		}
	}
}

func sumByRows(field [][]int) {
	for i := 0; i < len(field); i++ {
		for j := 0; j < len(field[i]); j++ {
			if field[i][j] == -1 {
				if j != 0 && field[i][j - 1] != -1 {
					field[i][j - 1]++
				}
				if j != len(field[i]) - 1 && field[i][j + 1] != -1 {
					field[i][j + 1]++
				}
			}
		}
	}
}

func sumByCols(field [][]int) {
	for i := 0; i < len(field); i++ {
		for j := 0; j < len(field[i]); j++ {
			if field[i][j] == -1 {
				if i != 0 && field[i - 1][j] != -1 {
					field[i - 1][j]++
				}
				if i != len(field) - 1 && field[i + 1][j] != -1 {
					field[i + 1][j]++
				}
			}
		}
	}
}

func sumByCross(field [][]int) {
	for i := 0; i < len(field); i++ {
		for j := 0; j < len(field[i]); j++ {
			if field[i][j] == -1 {
				if  i != 0 && j != 0 && field[i - 1][j - 1] != -1  {
					field[i - 1][j - 1]++
				}

				if  i != 0 && j != len(field[i]) - 1 && field[i - 1][j + 1] != -1  {
					field[i - 1][j + 1]++
				}

				if  i != len(field) - 1 && j != 0 && field[i + 1][j - 1] != -1  {
					field[i + 1][j - 1]++
				}

				if  i != len(field) - 1 && j != len(field[i]) - 1 && field[i + 1][j + 1] != -1  {
					field[i + 1][j + 1]++
				}
			}
		}
	}
}
