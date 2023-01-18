package main

import (
	"fmt"
	"golang-rest-api/app"
	"golang-rest-api/controller"
	"golang-rest-api/exception"
	"golang-rest-api/helper"
	"golang-rest-api/repository"
	"golang-rest-api/service"
	"net/http"

	_ "github.com/go-sql-driver/mysql"

	"github.com/go-playground/validator/v10"
	"github.com/julienschmidt/httprouter"
)

func main() {
	db := app.NewDB()
	validate := validator.New()
	clientRepository := repository.NewClientRepository()
	clientService := service.NewClientService(clientRepository, db, validate)
	clientController := controller.NewClientController(clientService)

	router := httprouter.New()

	router.GET("/api/client", clientController.FindAll)
	router.GET("/api/client/:clientId", clientController.FindById)
	router.POST("/api/client", clientController.Create)
	router.PUT("/api/client", clientController.Update)
	router.DELETE("/api/client/:clientId", clientController.Delete)

	router.PanicHandler = exception.ErrorHandler

	server := http.Server{
		Addr:    ":3300",
		Handler: router,
	}

	fmt.Println("server started at 0.0.0.0:3300 or 127.0.0.1:3300")
	err := server.ListenAndServe()
	helper.PanicIfError(err)
}
