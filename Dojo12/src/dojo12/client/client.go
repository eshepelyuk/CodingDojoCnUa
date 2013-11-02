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
	go websocket.JSON.Send(ws, requestData)
//	go websocket.JSON.Send(ws, "test2")

//	responseData  := new(TaskData)
//	var responseData TaskData
//	var data string
//	websocket.JSON.Receive(ws, &data)

	var responseData TaskData
//	var responseData []TaskData
	websocket.JSON.Receive(ws, &responseData)
//	websocket.Message.Receive(ws, &responseData)
	fmt.Println("client Received :", responseData)

	// receive text frame
//	var message string
//	websocket.Message.Receive(ws, &message)

//	var WebSocketClient = require('websocket').client;

	// receive binary frame
//	var data []byte
//	websocket.Message.Receive(ws, &data)
//	fmt.Println("client Received :", data)

//	var resp = make([]byte, 4096)
//	n, err := ws.Read(resp)
//	if err != nil {
//		panic(err)
//	}
//	fmt.Println("client Received:", string(resp[0:n]))



	return nil
}
