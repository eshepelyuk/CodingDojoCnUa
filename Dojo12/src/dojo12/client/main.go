package main

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
)

func main() {
	requestArr := []int{7, 6, 5, 4, 2, 1}
	var responseArr []int
	ws, err := websocket.Dial("ws://localhost:8080/myapp", "", "http://localhost:8080")
	if err != nil {
		panic(err)
	}

	fmt.Println("Sent :", requestArr)
	websocket.JSON.Send(ws, requestArr)

	websocket.JSON.Receive(ws, &responseArr)
	fmt.Println("Received! :", responseArr)
}
