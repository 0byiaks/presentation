package main

import (
	"fmt"
	"log"
	"net/http"
)

// handler for "/"
func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Hello, World!")
}

func main() {
	http.HandleFunc("/", helloHandler)

	port := "8080"
	log.Printf("Server starting on port %s...", port)

	err := http.ListenAndServe(":"+port, nil)
	if err != nil {
		log.Fatalf("Server failed to start: %v", err)
	}
}
