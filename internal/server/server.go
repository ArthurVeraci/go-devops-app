package server

import (
	"log"
	"net/http"

	"github.com/arthurveraci/go-devops-app/internal/handlers"
)

func Start() {
	mux := http.NewServeMux()

	mux.HandleFunc("/health", handlers.Health)

	log.Println("Servidor rodando na porta 8080...")
	log.Fatal(http.ListenAndServe(":8080", mux))
}
