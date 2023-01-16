package controller

import (
	"golang-rest-api/helper"
	"golang-rest-api/model/web"
	"golang-rest-api/service"
	"net/http"
	"strconv"

	"github.com/julienschmidt/httprouter"
)

type ClientControllerImpl struct {
	ClientService service.ClientService
}

func NewClientController(clientService service.ClientService) ClientController {
	return &ClientControllerImpl{
		ClientService: clientService,
	}
}

func (controller *ClientControllerImpl) Create(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	clientCreateRequest := web.ClientCreateRequest{}
	helper.ReadFromRequestBody(request, &clientCreateRequest)

	clientResponse := controller.ClientService.Create(request.Context(), clientCreateRequest)
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
		Data:   clientResponse,
	}

	helper.WriteToResponseBody(writer, webResponse)
}

func (controller *ClientControllerImpl) Update(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	clientUpdateRequest := web.ClientUpdateRequest{}
	helper.ReadFromRequestBody(request, &clientUpdateRequest)

	clientId := params.ByName("clientId")
	id, err := strconv.Atoi(clientId)
	helper.PanicIfError(err)

	clientUpdateRequest.Id = id

	clientResponse := controller.ClientService.Update(request.Context(), clientUpdateRequest)
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
		Data:   clientResponse,
	}

	helper.WriteToResponseBody(writer, webResponse)
}

func (controller *ClientControllerImpl) Delete(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	clientId := params.ByName("clientId")
	id, err := strconv.Atoi(clientId)
	helper.PanicIfError(err)

	controller.ClientService.Delete(request.Context(), id)
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
	}

	helper.WriteToResponseBody(writer, webResponse)
}

func (controller *ClientControllerImpl) FindById(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	clientId := params.ByName("clientId")
	id, err := strconv.Atoi(clientId)
	helper.PanicIfError(err)

	clientResponse := controller.ClientService.FindById(request.Context(), id)
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
		Data:   clientResponse,
	}

	helper.WriteToResponseBody(writer, webResponse)
}

func (controller *ClientControllerImpl) FindAll(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	clientResponses := controller.ClientService.FindAll(request.Context())
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
		Data:   clientResponses,
	}

	helper.WriteToResponseBody(writer, webResponse)
}
