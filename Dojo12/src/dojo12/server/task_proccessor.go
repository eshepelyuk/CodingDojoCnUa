package server

import (
	"dojo12/domain"
)

func TaskProcessor(requestChanel chan domain.TaskData, responseChannel chan domain.ResponseData){
	for ;; {
		var currentTask = <- requestChanel
		var result *domain.ResponseData = new (domain.ResponseData)
		switch currentTask.TaskType{
		case domain.SORT:
			result.ResultData = ExecuteSort(&currentTask)
			break
		case domain.PING:
			result.ResultData = ExecutePing(&currentTask)
		}
		if result != nil {
			result.TaskId = currentTask.TaskId
			responseChannel <- *result
		}
	}
}



