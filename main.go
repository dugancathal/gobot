package main

import (
	"fmt"
	"net/http"

	"github.com/arjunsharma/gobot/kittens"
	"github.com/arjunsharma/gobot/pugs"
	"github.com/gorilla/mux"
)

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/pugs/bomb/{count}", pugs.BombHandler)
	router.HandleFunc("/pugs/random", pugs.RandomHandler)

	router.HandleFunc("/kittens/random", kittens.RandomHandler)
	router.HandleFunc("/kittens/bomb/{count}", kittens.BombHandler)

	router.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(200)
		fmt.Fprintf(writer, "NICE!")
	})
	http.Handle("/", router)
	http.ListenAndServe(":9999", nil)
}
