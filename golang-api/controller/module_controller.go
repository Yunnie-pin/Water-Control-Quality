package controller

import (
	"golang-rest-api/helper"
	"golang-rest-api/model/web"
	"golang-rest-api/service"
	"net/http"
	"strconv"

	"github.com/julienschmidt/httprouter"
)

type ModuleController struct {
	ModuleService service.BaseModuleService
}

func NewModuleController(moduleService service.BaseModuleService) BaseController {
	return &ModuleController{
		ModuleService: moduleService,
	}
}

func (controller *ModuleController) Create(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	moduleCreateRequest := web.ModuleCreateRequest{}
	helper.ReadFromRequestBody(request, &moduleCreateRequest)

	moduleResponse := controller.ModuleService.Create(request.Context(), moduleCreateRequest)
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
		Data:   moduleResponse,
	}

	helper.WriteToResponseBody(writer, webResponse)
}

func (controller *ModuleController) Update(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	moduleUpdateRequest := web.ModuleUpdateRequest{}
	helper.ReadFromRequestBody(request, &moduleUpdateRequest)

	moduleId := params.ByName("moduleId")
	id, err := strconv.Atoi(moduleId)
	helper.PanicIfError(err)

	moduleUpdateRequest.Id = id

	moduleResponse := controller.ModuleService.Update(request.Context(), moduleUpdateRequest)
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
		Data:   moduleResponse,
	}

	helper.WriteToResponseBody(writer, webResponse)
}

func (controller *ModuleController) Delete(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	moduleId := params.ByName("moduleId")
	id, err := strconv.Atoi(moduleId)
	helper.PanicIfError(err)

	controller.ModuleService.Delete(request.Context(), id)
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
	}

	helper.WriteToResponseBody(writer, webResponse)
}

func (controller *ModuleController) FindById(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	moduleId := params.ByName("moduleId")
	id, err := strconv.Atoi(moduleId)
	helper.PanicIfError(err)

	moduleResponse := controller.ModuleService.FindById(request.Context(), id)
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
		Data:   moduleResponse,
	}

	helper.WriteToResponseBody(writer, webResponse)
}

func (controller *ModuleController) FindAll(writer http.ResponseWriter, request *http.Request, params httprouter.Params) {
	moduleResponses := controller.ModuleService.FindAll(request.Context())
	webResponse := web.WebResponse{
		Code:   200,
		Status: "OK",
		Data:   moduleResponses,
	}

	helper.WriteToResponseBody(writer, webResponse)
}
