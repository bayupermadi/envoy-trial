package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	words := os.Args[2]
	fmt.Fprintf(w, words+" %s!", r.URL.Path[1:])
}

func main() {
	port := os.Args[1]
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(port, nil))
}
