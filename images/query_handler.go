package images

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math/rand"
	"net/http"
	"net/url"

	"github.com/gorilla/mux"
)

func QueryHandler(writer http.ResponseWriter, request *http.Request) {
	queryStr := url.QueryEscape(mux.Vars(request)["query"])
	response, err := http.Get(fmt.Sprintf("http://ajax.googleapis.com/ajax/services/search/images?v=1.0&rsz=8&q=%s", queryStr))
	defer response.Body.Close()

	if err != nil {
		writer.WriteHeader(http.StatusInternalServerError)
		return
	}
	body, err := ioutil.ReadAll(response.Body)

	resp := make(map[string]interface{})
	err = json.Unmarshal(body, &resp)
	if err != nil {
		writer.WriteHeader(http.StatusInternalServerError)
		return
	}

	images := resp["responseData"].(map[string]interface{})["results"].([]interface{})
	imageIndex := int(float32(len(images)) * rand.Float32())
	imageUrl := images[imageIndex].(map[string]interface{})["url"].(string)
	fmt.Fprintf(writer, "<html><body><img src='%s' /></body></html>", imageUrl)

	return
}
