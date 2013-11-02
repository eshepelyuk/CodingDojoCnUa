package server

import (
	"code.google.com/p/go.net/websocket"
	"fmt"
	"sort"
	"strings"
	. "dojo12/domain"
	. "strconv"
)

func HandleConn(c *websocket.Conn) {
	var receivedData = new(TaskData)

	/*var data string
	websocket.JSON.Receive(c, &data)
	fmt.Println("handler Received :", data)*/

	websocket.JSON.Receive(c, &receivedData)
	fmt.Println("handler Received :", *receivedData)

//	go websocket.JSON.Send(c, "test1")
//	var data2 = []byte{0, 1, 2}
//	go websocket.Message.Send(c, data2)

	var resp = TaskData{1,2,"hello"}
//	var resp = []TaskData{TaskData{1, 2, "hello"}}
	go websocket.JSON.Send(c, resp)
//	go websocket.Message.Send(c, resp)

//	for{
//		websocket.JSON.Receive(c, &receivedData)
//	}
	return

//	fmt.Println("Connection saved", c)
	Connections[receivedData.TaskId] = c
//	ReqChannel <- receivedData
//	fmt.Println("Sent")


	var responseData = new(TaskData)
	switch receivedData.TaskType{
	case PING:
		responseData = ExecutePing(receivedData)
		break
	case SORT:
		responseData = ExecuteSort(receivedData)
		break
	}
	fmt.Println("Response data: ", responseData)
	send(Connections[receivedData.TaskId], responseData)
//	go websocket.JSON.Send(Connections[receivedData.TaskId], responseData)
//	ReqChannel <- receivedData

}

func send(c *websocket.Conn, d *TaskData) {
	fmt.Println("Response data 222 ", *d)
	go websocket.JSON.Send(c, d)
}

func DontUseThis() {
	fmt.Println("DontUseThis started")
	for receivedData := range ReqChannel {
//	for {
//		receivedData := <-ReqChannel
		fmt.Println("ReqChannel recv", receivedData)

		var responseData = new(TaskData)
		switch receivedData.TaskType{
		case PING:
			responseData = ExecutePing(receivedData)
			break
		case SORT:
			responseData = ExecuteSort(receivedData)
			break
		}
		fmt.Println("Response data: ", responseData)
		fmt.Println("Connection to send ", Connections[receivedData.TaskId])

		go websocket.JSON.Send(Connections[receivedData.TaskId], receivedData)
	}
	fmt.Println("Exception: exit from ReqChannel")
}

func ExecutePing(requestData *TaskData) (*TaskData) {
	return requestData
}

func ExecuteSort(requestData *TaskData) (*TaskData) {
//	sortArr := []string{"3", "5", "7", "20"}
	strArr := strings.Split( requestData.TaskData, "," )
	sortArr := make( []int, len( strArr ) )
	for i,strValue := range strArr {
		rezInt64, _ := ParseInt(strings.TrimSpace(strValue) , 10, 0)
		print(rezInt64)
		sortArr[i] = int( rezInt64 )
	}

	sort.Ints(sortArr)

	rezIntArr := make( []string, len( strArr ) )
	for i,intValue := range sortArr {
		rezIntArr[i] = FormatInt( int64( intValue ), 10 )
	}

	responseData := new(TaskData)
	responseData.TaskData = strings.Join(rezIntArr, ", ")
	return responseData
}



