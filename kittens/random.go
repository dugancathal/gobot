package kittens

import (
	"fmt"
	"math/rand"
	"net/http"
)

func RandomHandler(writer http.ResponseWriter, request *http.Request) {
	height := (rand.Float32() * 400) + 100
	width := (rand.Float32() * 400) + 100

	kittenUrl := fmt.Sprintf("http://placekitten.com/%d/%d", int(height), int(width))
	fmt.Fprintf(writer, "<html><body><img src='%s' /></body></html>", kittenUrl)

	return
}
