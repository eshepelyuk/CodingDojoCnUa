package dojo11
import "strconv"


func Minesweeper(input [][]string) [][]string {
	strLen := 0
	for j := 0; j<len(input); j++  {
		if strLen < len(input[j]) {
			strLen = len(input[j])
		}
	}

	out := make( [][]string, len(input) )
	for j := 0; j<len(out); j++  {
		out[j] = make( []string, strLen )
		for i := 0; i<len(out[0]); i++ {
			out[j][i] = "."
			if i < len( input[j] ) {
				out[j][i] = input[j][i]
			}
		}
	}
	for j := 0; j<len(out); j++  {
		for i := 0; i<len(out[0]); i++ {
			if out[j][i] == "." {
				out[j][i] = "0"
			}
			if  out[j][i] == "*" {
				if j > 0 && out[j-1][i] != "*" {
					tmp,_ := strconv.Atoi(out[j-1][i])
					out[j-1][i] = strconv.Itoa( tmp +1 )
				}
				if j < len(out)-1 && out[j+1][i] != "*" {
					tmp,_ := strconv.Atoi(out[j+1][i])
					out[j+1][i] = strconv.Itoa( tmp +1 )
				}
				if i > 0 && out[j][i-1] != "*" {
					tmp,_ := strconv.Atoi(out[j][i-1])
					out[j][i-1] = strconv.Itoa( tmp +1 )
				}
				if i < len(out[j])-1 && out[j][i+1] != "*" {
					tmp,_ := strconv.Atoi(out[j][i+1])
					out[j][i+1] = strconv.Itoa( tmp +1 )
				}

				if i > 0 && j > 0 && out[j-1][i-1] != "*" {
					tmp,_ := strconv.Atoi(out[j-1][i-1])
					out[j-1][i-1] = strconv.Itoa( tmp +1 )
				}
				if i < len(out[j]) -1  && j < len(out)-1 && out[j+1][i+1] != "*" {
					tmp,_ := strconv.Atoi(out[j+1][i+1])
					out[j+1][i+1] = strconv.Itoa( tmp +1 )
				}

				if j < len(out) - 1 && i > 0 && out[j+1][i-1] != "*" {
					tmp,_ := strconv.Atoi(out[j+1][i-1])
					out[j+1][i-1] = strconv.Itoa( tmp +1 )
				}
				if i < len(out[j]) - 1 && j > 0 && out[j-1][i+1] != "*" {
					tmp,_ := strconv.Atoi(out[j-1][i+1])
					out[j-1][i+1] = strconv.Itoa( tmp +1 )
				}
			}
		}

	}
	return out
}
