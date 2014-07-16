package soothe

import (
	"fmt"
	"math/rand"
	"net/http"
)

func SootheHandler(writer http.ResponseWriter, request *http.Request) {
	calmIndex := int(33*rand.Float32()) + 1
	calmUrl := fmt.Sprintf("http://calmingmanatee.com/img/manatee%d.jpg", calmIndex)
	fmt.Fprintf(writer, "<html><body><img src='%s' /></body></html>", calmUrl)

	return
}
