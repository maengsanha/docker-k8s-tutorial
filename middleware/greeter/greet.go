package greeter

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func Greet() gin.HandlerFunc {
	return func(c *gin.Context) {
		c.String(http.StatusOK, "Hello %s!", c.Query("name"))
	}
}
