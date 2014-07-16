package names

import (
"encoding/json"
"encoding/csv"
"strconv"
"net/http"
)

type NameResponse struct {
	Name string `json:"name"`
}

func JsonNameHandler(writer http.ResponseWriter, request *http.Request) {
	numNamesParam := request.URL.Query().Get("limit")
	numNames, err := strconv.ParseInt(numNamesParam, 10, 0)
		if err != nil {
		numNames = 1
	}

	response := []NameResponse{}
	for i := 0; int64(i) < numNames; i++ {
		name := randomName()
		response = append(response, NameResponse{Name: name})
	}

	jsonResponse, _ := json.Marshal(response)
	writer.Write(jsonResponse)

	return
}

func CsvNameHandler(writer http.ResponseWriter, request *http.Request) {
	numNamesParam := request.URL.Query().Get("limit")
	numNames, err := strconv.ParseInt(numNamesParam, 10, 0)
		if err != nil {
		numNames = 1
	}

	csvWriter := csv.NewWriter(writer)

	for i := 0; int64(i) < numNames; i++ {
		csvWriter.Write([]string{randomName()})
	}

	csvWriter.Flush()

	return
}
