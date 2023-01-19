package helper

import (
	"golang-rest-api/model/domain"
	"golang-rest-api/model/web"
)

func ToClientResponse(client domain.Client) web.ClientResponse {
	return web.ClientResponse{
		Id:   client.Id,
		Name: client.Name,
	}
}

func ToClientResponses(clients []domain.Client) []web.ClientResponse {
	var ClientResponses []web.ClientResponse
	for _, client := range clients {
		ClientResponses = append(ClientResponses, ToClientResponse(client))
	}
	return ClientResponses
}

func ToModuleResponse(module domain.Module) web.ModuleResponse {
	return web.ModuleResponse{
		Id:    module.Id,
		Name:  module.Name,
		Value: module.Value,
	}
}

func ToModuleResponses(modules []domain.Module) []web.ModuleResponse {
	var ModuleResponses []web.ModuleResponse
	for _, module := range modules {
		ModuleResponses = append(ModuleResponses, ToModuleResponse(module))
	}
	return ModuleResponses
}
