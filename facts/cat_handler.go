package facts

import (
"encoding/json"
"fmt"
"io/ioutil"
"net/http"
)

func CatHandler(writer http.ResponseWriter, request *http.Request) {
	response, err := http.Get("http://catfacts-api.appspot.com/api/facts?number=1")
	defer response.Body.Close()

	if err != nil {
		fmt.Println(err)
		writer.WriteHeader(http.StatusInternalServerError)
		return
	}
	body, err := ioutil.ReadAll(response.Body)

	resp := make(map[string]interface{})
	err = json.Unmarshal(body, &resp)
	if err != nil {
		fmt.Println(err)
		writer.WriteHeader(http.StatusInternalServerError)
		return
	}

	presentedResponse := make(map[string]interface{})
	presentedResponse["fact"] = resp["facts"].([]interface{})[0].(string)

	jsonResponse, err := json.Marshal(presentedResponse)
	if err != nil {
		fmt.Println(err)
		writer.WriteHeader(http.StatusInternalServerError)
		return
	}

	writer.Write(jsonResponse)

	return
}
