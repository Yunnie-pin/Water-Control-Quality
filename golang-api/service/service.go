package service

import (
	"context"
	"golang-rest-api/model/web"
)

type BaseClientService interface {
	Create(ctx context.Context, request web.ClientCreateRequest) web.ClientResponse
	Update(ctx context.Context, request web.ClientUpdateRequest) web.ClientResponse
	Delete(ctx context.Context, clientId int)
	FindById(ctx context.Context, clientId int) web.ClientResponse
	FindAll(ctx context.Context) []web.ClientResponse
}

type BaseModuleService interface {
	Create(ctx context.Context, request web.ModuleCreateRequest) web.ModuleResponse
	Update(ctx context.Context, request web.ModuleUpdateRequest) web.ModuleResponse
	Delete(ctx context.Context, clientId int)
	FindById(ctx context.Context, clientId int) web.ModuleResponse
	FindAll(ctx context.Context) []web.ModuleResponse
}
