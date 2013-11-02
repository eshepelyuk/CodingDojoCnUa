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
	var responseData = new(ResponseData)
	var receivedData = new(TaskData)

	websocket.JSON.Receive(c, &receivedData)
	fmt.Println("Received :", receivedData)

	//	sort.Ints(receivedData.TaskData)

	fmt.Println("Sorted :", receivedData)
	switch receivedData.TaskType{
	case PING:
		responseData.ResultData = ExecutePing(receivedData)
		break
	case SORT:
		responseData.ResultData = ExecuteSort(receivedData)
		break
	}
	websocket.JSON.Send(c, responseData)
}

func ExecutePing(requestData *TaskData) (string) {
	return requestData.TaskData
}

func ExecuteSort(requestData *TaskData) (string) {
	//	sortArr := []string{"3", "5", "7", "20"}
	strArr := strings.Split(requestData.TaskData, ",")
	sortArr := make([]int, len(strArr))
	for i, strValue := range strArr {
		rezInt64, _ := ParseInt(strings.TrimSpace(strValue) , 10, 0)
//		print(rezInt64)
		sortArr[i] = int(rezInt64)
	}

	sort.Ints(sortArr)

	rezIntArr := make([]string, len(strArr))
	for i, intValue := range sortArr {
		rezIntArr[i] = FormatInt(int64(intValue), 10)
	}

	return strings.Join(rezIntArr, ", ")
}



