package main

import (
	"code.google.com/p/go.net/websocket"
	"net/http"
	"log"
	. "dojo12/server"
	. "dojo12/domain"
)

func main() {

	go TaskProcessor(RequestChannel, ResponseChannel)
	http.Handle("/myapp", websocket.Handler(HandleConn))
	log.Print("Server started")

	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}
