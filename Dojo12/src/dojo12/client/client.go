package client

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
)

func SendRequest(inArr []int) []int {
	var responseArr []int

	ws, err := websocket.Dial("ws://localhost:8080/myapp", "", "http://localhost:8080")
	if err != nil {
		panic(err)
	}

	fmt.Println("Sent :", inArr)
	websocket.JSON.Send(ws, inArr)

	websocket.JSON.Receive(ws, &responseArr)
	fmt.Println("Received :", responseArr)

	return responseArr
}
