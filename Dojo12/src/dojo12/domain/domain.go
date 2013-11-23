package domain

import (
)

const (
	STATUS = 1
	KILL   = 2
	PING   = 3
	SORT   = 20
)


type TaskData struct {
	TaskId int
	TaskType int
	TaskData string
}

type ResponseData struct {
	TaskId int
	ResultData string
}

var TaskMapping map[int]chan string = make(map[int]chan string)

var RequestChannel = make(chan TaskData, 100)
var ResponseChannel = make(chan ResponseData, 100)


