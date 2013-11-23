package dojo12

import (
	"github.com/orfjackal/gospec/src/gospec"
	. "github.com/orfjackal/gospec/src/gospec"
	. "dojo12/client"
	. "dojo12/domain"
//	"dojo12/domain"
//	"dojo12/server"
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

	/*c.Specify("When send unsorted strings data should return sorted strings data", func() {

			actualData := &TaskData{0, SORT, "7, 3, 20, 5"}
			expectedData := &TaskData{0, SORT, "3, 5, 7, 20"}

			var result = SendRequest(actualData)
			c.Expect(result.TaskData, Equals, expectedData.TaskData)
	})

	c.Specify("When send unsorted strings data processor should return sorted strings data", func() {
			actualData := &TaskData{0, SORT, "7, 3, 40, 5"}
			expectedData := &ResponseData{0, "3, 5, 7, 40"}

			requestChannel := make(chan domain.TaskData)
			responseChannel := make(chan domain.ResponseData)
			go server.TaskProcessor(requestChannel, responseChannel)
			requestChannel <-  *actualData

			var result = <- responseChannel
			c.Expect(result.ResultData, Equals, expectedData.ResultData)
			c.Expect(result.TaskId, Equals, expectedData.TaskId)

	})

	c.Specify("Test task processor with many tasks", func() {
			actualData := &TaskData{0, SORT, "7, 3, 40, 5"}
			expectedData := &ResponseData{0, "3, 5, 7, 40"}

			requestChannel := make(chan domain.TaskData, 100)
			responseChannel := make(chan domain.ResponseData, 100)
			go server.TaskProcessor(requestChannel, responseChannel)

			for i := 0; i < 10; i++ {
				requestChannel <-  *actualData
			}
			killPackage := &TaskData{0, KILL, "7, 3, 40, 5"}
			requestChannel <-  *killPackage

			for i := 0; i < 10; i++ {
//				requestChannel <-  *actualData
				var result = <- responseChannel
				c.Expect(result.ResultData, Equals, expectedData.ResultData)
				c.Expect(result.TaskId, Equals, expectedData.TaskId)
			}
		})*/
}




