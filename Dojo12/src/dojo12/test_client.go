package dojo12

import (
	"github.com/orfjackal/gospec/src/gospec"
	. "github.com/orfjackal/gospec/src/gospec"
//	"fmt"
	"dojo12/client"
)

func AcceptanceSpec(c gospec.Context) {
	c.Specify("", func() {
			c.Expect(client.SendRequest([]int{3,1,2}), ContainsInOrder, []int{1,2,3})
		})
}


