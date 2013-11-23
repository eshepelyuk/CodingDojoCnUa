package server

import (
	. "dojo12/domain"
	"fmt"
)

func TaskProcessor(requestChanel chan TaskData){
	for ;; {
		var currentTask = <- requestChanel
		fmt.Println( "TaskProcessor receive from chanel", currentTask)

// TODO remove switch. Create universal method to add new tasks
		switch currentTask.TaskType{
		case SORT:
			// TODO call Batcher sort
			break
		case PING:
			go execPing(&currentTask)
			break
		case KILL:
			return
		}
	}
}

func execPing(task *TaskData) {
	fmt.Println("ExecutePing Received: ", *task)
	TaskMapping[task.TaskId] <- task.TaskData
}



