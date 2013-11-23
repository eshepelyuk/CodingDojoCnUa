package server

import (
	. "dojo12/domain"
	"fmt"
)

func TaskProcessor(requestChanel chan TaskData, responseChannel chan ResponseData){
	fmt.Println( "TaskProcessor started" )
	for ;; {
		fmt.Println( "for TaskProcessor started" )
		var currentTask = <- requestChanel
		fmt.Println( "for TaskProcessor receive from chanel" )
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
			responseChannel <- *result
		}
	}
}

func ExecutePing(requestData *TaskData) (*TaskData) {
	fmt.Println("ExecutePing Received :", *requestData)
	return requestData
}



