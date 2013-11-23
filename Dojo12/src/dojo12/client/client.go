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
	errCode := websocket.JSON.Send(ws, requestData)
	fmt.Println("Client sending errCode:", errCode)

	responseData := new(ResponseData)
	errCode = websocket.JSON.Receive(ws, responseData)
	fmt.Println("client Received :", responseData)
	fmt.Println("client Received errCode :", errCode)

	return responseData
}
