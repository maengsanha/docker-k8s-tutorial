package main

import (
	"github.com/gin-gonic/gin"
	"github.com/maengsanha/docker-k8s-tutorial/router"
)

func main() {
	engine := gin.Default()

	gin.SetMode(gin.ReleaseMode)

	engine.GET("/hello", router.Greet())

	engine.Run(":8080")
}
