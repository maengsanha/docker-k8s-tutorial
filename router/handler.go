package router

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// Greet returns a greeting message.
func Greet() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.String(http.StatusOK, "Hello %s!", c.Query("name"))
	}
}
