package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(200)
		fmt.Fprintf(writer, "NICE!")
	})
	http.ListenAndServe(":9999", nil)
}
