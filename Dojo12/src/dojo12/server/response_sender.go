package server

import (
	. "dojo12/domain"
	"code.google.com/p/go.net/websocket"
	"fmt"
)

func ResponseSender(responseChannel chan ResponseData){
	fmt.Println("ResponseSender started" )
	for ;; {
		fmt.Println( "for ResponseSender started" )
		var currentTask = <- responseChannel
		send(Connections[currentTask.TaskId], currentTask);
	}
}

func send(c *websocket.Conn, d ResponseData) {
	fmt.Println("Server sending response" + d.ResultData);
	websocket.JSON.Send(c, "qwerty")
}




