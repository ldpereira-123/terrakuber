package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func IndexHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hey, it works!")
}

func main() {
	router := mux.NewRouter()
	router.HandleFunc("/", IndexHandler).Methods("GET")
	log.Fatal(http.ListenAndServe(":1337", router))
}
