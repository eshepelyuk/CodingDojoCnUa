package client

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
	. "dojo12/domain"
)

func SendRequest(requestData *TaskData) (*TaskData) {
	ws, err := websocket.Dial("ws://localhost:8080/myapp", "", "http://localhost:8080")
	if err != nil {
		panic(err)
	}

	fmt.Println("Sent :", 	requestData)
	websocket.JSON.Send(ws, requestData)

	responseData  := new(TaskData)
	websocket.JSON.Receive(ws, responseData)
	fmt.Println("client Received :", *responseData)

	return responseData
}
