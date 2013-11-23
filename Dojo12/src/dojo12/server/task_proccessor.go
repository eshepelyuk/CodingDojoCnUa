package server

import (
	. "dojo12/domain"
	"fmt"
)

func TaskProcessor(requestChanel chan TaskData, responseChannel chan ResponseData){
	print( "TaskProcessor started\n" )
	for ;; {
		print( "for TaskProcessor started\n" )
		var currentTask = <- requestChanel
		print( "for TaskProcessor 2\n" )
		var result *ResponseData = new (ResponseData)
		switch currentTask.TaskType{
		case SORT:
			result.ResultData = ExecuteSort(&currentTask).TaskData
			break
		case PING:
			result.ResultData = ExecutePing(&currentTask).TaskData
			break
		case KILL:
			return
		}

		if result != nil {
			result.TaskId = currentTask.TaskId
			print(currentTask.TaskId)
			print(result.TaskId)
//			responseChannel <- *result
		}
	}
}

func ExecutePing(requestData *TaskData) (*TaskData) {
	fmt.Println("ExecutePing Received :", *requestData)
	return requestData
}



