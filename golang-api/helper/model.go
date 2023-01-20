package helper

import (
	"golang-rest-api/model/domain"
	"golang-rest-api/model/web"
)

func ToClientResponse(client domain.Client) web.ClientResponse {
	return web.ClientResponse{
		Id:        client.Id,
		Name:      client.Name,
		Result:    client.Result,
		ModuleId:  client.ModuleId,
		CreatedAt: client.CreatedAt.Format("2006-01-02 15:04:05"),
		UpdatedAt: client.UpdatedAt.Format("2006-01-02 15:04:05"),
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
		Id:        module.Id,
		Name:      module.Name,
		Value:     module.Value,
		CreatedAt: module.CreatedAt.Format("2006-01-02 15:04:05"),
		UpdatedAt: module.UpdatedAt.Format("2006-01-02 15:04:05"),
	}
}

func ToModuleResponses(modules []domain.Module) []web.ModuleResponse {
	var ModuleResponses []web.ModuleResponse
	for _, module := range modules {
		ModuleResponses = append(ModuleResponses, ToModuleResponse(module))
	}
	return ModuleResponses
}
