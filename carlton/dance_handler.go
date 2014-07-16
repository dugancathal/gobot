package carlton

import (
	"fmt"
	"math/rand"
	"net/http"
)

func DanceHandler(writer http.ResponseWriter, request *http.Request) {
	imageSet := []string{
		"http://imgur.com/t4EZhsD.gif",
		"http://imgur.com/7YIfBiV.gif",
		"http://imgur.com/4K7eo3s.gif",
		"http://imgur.com/kKXW55q.gif",
		"http://imgur.com/OE5KuZH.gif",
	}

	danceIndex := int(5 * rand.Float32())
	fmt.Fprintf(writer, "<html><body><img src='%s' /></body></html>", imageSet[danceIndex])

	return
}
