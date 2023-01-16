package service

import (
	"context"
	"golang-rest-api/model/web"
)

type ClientService interface {
	Create(ctx context.Context, request web.ClientCreateRequest) web.ClientResponse
	Update(ctx context.Context, request web.ClientUpdateRequest) web.ClientResponse
	Delete(ctx context.Context, clientId int)
	FindById(ctx context.Context, clientId int) web.ClientResponse
	FindAll(ctx context.Context) []web.ClientResponse
}
