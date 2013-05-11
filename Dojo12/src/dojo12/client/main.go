package main

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
)

const message = "Hello world"

func main() {
	ws, err := websocket.Dial("ws://localhost:8080/myapp", "", "http://localhost:8080")
	if err != nil {
		panic(err)
	}
	if _, err := ws.Write([]byte(message)); err != nil {
		panic(err)
	}
	var resp = make([]byte, 4096)
	n, err := ws.Read(resp)
	if err != nil {
		panic(err)
	}
	fmt.Println("Received:::", string(resp[0:n]))
}
