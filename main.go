package main

import (
	"fmt"
	"net/http"

	"github.com/arjunsharma/gobot/pugs"
	"github.com/gorilla/mux"
)

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/pugs/bomb/{count}", pugs.BombHandler)
	router.HandleFunc("/pugs/random", pugs.RandomHandler)
	router.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		fmt.Fprintf(writer, "NICE!")
		writer.WriteHeader(200)
	})
	http.Handle("/", router)
	http.ListenAndServe(":9999", nil)
}
