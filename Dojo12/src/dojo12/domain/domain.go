package domain

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


