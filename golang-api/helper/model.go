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