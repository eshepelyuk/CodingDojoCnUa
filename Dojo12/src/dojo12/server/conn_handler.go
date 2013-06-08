package server

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
	"sort"
)

func HandleConn(c *websocket.Conn) {
	var receivedData []int

	websocket.JSON.Receive(c, &receivedData)
	fmt.Println("Received :", receivedData)

	sort.Ints(receivedData)

	fmt.Println("Sorted :", receivedData)

	websocket.JSON.Send(c, receivedData)
}
