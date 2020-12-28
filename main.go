package main

import (
	"github.com/gin-gonic/gin"
	"github.com/maengsanha/docker-k8s-tutorial/middleware/greeter"
)

func main() {
	engine := gin.Default()

	gin.SetMode(gin.ReleaseMode)
	api := engine.Group("/api")
	api.GET("/hello", greeter.Greet())

	engine.Run() // default: :8080
}
