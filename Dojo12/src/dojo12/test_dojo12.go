package dojo12

import (
	"github.com/orfjackal/gospec/src/gospec"
	. "github.com/orfjackal/gospec/src/gospec"
)

func MySpec(c gospec.Context) {
	c.Specify("should test with gospec", func() {
			c.Expect(Dojo12(), Equals, 1)
		})
}


