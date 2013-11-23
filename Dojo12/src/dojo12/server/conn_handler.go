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

	websocket.JSON.Receive(c, &receivedData)
	fmt.Println("handler Received :", *receivedData)

	Connections[receivedData.TaskId] = c
	RequestChannel <- *receivedData

	// get result data from resp chan
//	send(Connections[receivedData.TaskId], responseData)
}

/*func send(c *websocket.Conn, d *TaskData) {
	fmt.Println("Response data 222 ", *d)
	go websocket.JSON.Send(c, d)

	var dummyWait TaskData
	websocket.JSON.Receive(c, &dummyWait)
}*/

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



