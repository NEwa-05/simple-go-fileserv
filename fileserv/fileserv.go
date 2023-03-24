package main

import (
	"log"
	"net/http"
	"os"
)

var appPort = os.Getenv("APP_PORT")

func main() {
	fs := http.FileServer(http.Dir("/tmp"))
	http.Handle("/", fs)
	err := http.ListenAndServe(appPort, nil)
	if err != nil {
		log.Fatal(err)
	}
}
