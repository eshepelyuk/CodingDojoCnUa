package main

import (
	"code.google.com/p/go.net/websocket"
	"net/http"
	"log"
	"dojo12/server"
	"dojo12/domain"
)

func main() {
	go DontUseThis()
	http.Handle("/myapp", websocket.Handler(HandleConn))
	log.Print("Server started")
	log.Print("Server started")
	RequestChannel := make(chan domain.TaskData)
	ResponseChannel := make(chan domain.ResponseData)
	go server.TaskProcessor(RequestChannel, ResponseChannel)
	http.Handle("/myapp", websocket.Handler(server.HandleConn))
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}
