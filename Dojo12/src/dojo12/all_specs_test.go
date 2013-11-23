package dojo12

import (
	"github.com/orfjackal/gospec/src/gospec"
	"testing"
)

func TestAllSpecs(t *testing.T) {
	r := gospec.NewRunner()

//	r.AddSpec(BatcherSortSpec)
	r.AddSpec(AcceptanceSpec)

	gospec.MainGoTest(r, t)
}
