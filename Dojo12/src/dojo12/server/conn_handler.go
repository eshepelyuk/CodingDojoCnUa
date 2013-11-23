package server

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
	. "dojo12/domain"
)

func HandleConn(c *websocket.Conn) {
	fmt.Println("WS handler start")
	var receivedData = new(TaskData)

	errCode  := websocket.JSON.Receive(c, &receivedData)
	fmt.Println("WS handler received :", *receivedData)
	fmt.Println("WS handler errCode :", errCode)

	TaskMapping[receivedData.TaskId] = make(chan string, 1)

	RequestChannel <- *receivedData

	respStr := <- TaskMapping[receivedData.TaskId]
	websocket.JSON.Send(c, &ResponseData{receivedData.TaskId, respStr})

	fmt.Println("WS handler stop")

// TODO Multiple tasks support
// TODO Handle client timeout
// TODO Return task status
}


