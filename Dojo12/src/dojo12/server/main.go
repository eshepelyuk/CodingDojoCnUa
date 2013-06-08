package main

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
	"net/http"
	"log"
	"dojo12/server"
	"sort"
)

func main() {
	fmt.Println("Server started", server.ServerFunc())
	http.Handle("/myapp", websocket.Handler(Echo))
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}

func Echo(c *websocket.Conn) {
	var receivedData []int

	websocket.JSON.Receive(c, &receivedData)
	fmt.Println("Received :", receivedData)

	sort.Ints(receivedData)

	fmt.Println("Sorted :", receivedData)

	websocket.JSON.Send(c, receivedData)
}
