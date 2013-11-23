package server

import (
	. "dojo12/domain"
	"fmt"
)

func ResponseSender(responseChannel chan ResponseData){
	fmt.Println("ResponseSender started" )
	for ;; {
		fmt.Println( "for ResponseSender started" )
		var currentTask = <- responseChannel
		fmt.Println(currentTask.ResultData)
	}
}




