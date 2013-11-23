package client

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
	. "dojo12/domain"
)

func SendRequest(requestData *TaskData) (*ResponseData) {
	ws, err := websocket.Dial("ws://localhost:8080/myapp", "", "http://localhost:8080")
	if err != nil {
		panic(err)
	}

	fmt.Println("Client sending:", 	requestData)
	websocket.JSON.Send(ws, requestData)

	var res []string

	errCode := websocket.JSON.Receive(ws, res)
	fmt.Println("client Received1 :", res)
	fmt.Println("client Received errCode :", errCode)

	responseData := new(ResponseData)
	return responseData
}
