package main

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
	"net/http"
	"log"
	"dojo12/server"
)

func main() {
	fmt.Println("qwe", server.ServerFunc())
	http.Handle("/myapp", websocket.Handler(Echo))
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal("ListenAndServe:", err)
	}
}

func Echo(c *websocket.Conn) {
	var s string
	fmt.Fscan(c, &s)
	fmt.Println("Received:", s)
	fmt.Fprint(c, "How do you do???")
}
