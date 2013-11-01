package main

import (
	"code.google.com/p/go.net/websocket"
	"net/http"
	"log"
	. "dojo12/server"
)

func main() {
	log.Print("Server started")
	http.Handle("/myapp", websocket.Handler(HandleConn))
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}
