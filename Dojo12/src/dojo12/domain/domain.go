package domain

import (
	"code.google.com/p/go.net/websocket"
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



var Connections map[int]*websocket.Conn = make(map[int]*websocket.Conn)

var ReqChannel chan * TaskData = make(chan * TaskData, 1)


