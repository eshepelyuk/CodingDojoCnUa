package dojo12

import (
	"github.com/orfjackal/gospec/src/gospec"
	. "github.com/orfjackal/gospec/src/gospec"
	. "dojo12/client"
	. "dojo12/domain"
)

func AcceptanceSpec(c gospec.Context) {

	c.Specify("When send structed data should return stracted data", func() {

			expectedData := &TaskData{0, PING, "3, 5, 7, 20"}
			actualData := &TaskData{0, PING, "3, 5, 7, 20"}

			var result = SendRequest(actualData)
			c.Expect(result.TaskId,   Equals, expectedData.TaskId)
			c.Expect(result.TaskType, Equals, expectedData.TaskType)
			c.Expect(result.TaskData, Equals, expectedData.TaskData)
		})

	c.Specify("When send unsorted strings data should return sorted strings data", func() {

			actualData := &TaskData{0, SORT, "7, 3, 20, 5"}
			expectedData := &TaskData{0, SORT, "3, 5, 7, 20"}

			var result = SendRequest(actualData)
			c.Expect(result.TaskData, Equals, expectedData.TaskData)
	})
}




