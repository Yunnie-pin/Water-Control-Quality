package service

import (
	"context"
	"database/sql"
	"golang-rest-api/exception"
	"golang-rest-api/helper"
	"golang-rest-api/model/domain"
	"golang-rest-api/model/web"
	"golang-rest-api/repository"

	"github.com/go-playground/validator/v10"
)

type ClientService struct {
	ClientRepository repository.BaseClientRepository
	DB               *sql.DB
	Validate         *validator.Validate
}

func NewClientService(ClientRepository repository.BaseClientRepository, DB *sql.DB, validate *validator.Validate) BaseClientService {
	return &ClientService{
		ClientRepository: ClientRepository,
		DB:               DB,
		Validate:         validate,
	}
}

func (service *ClientService) Create(ctx context.Context, request web.ClientCreateRequest) web.ClientResponse {
	err := service.Validate.Struct(request)
	helper.PanicIfError(err)

	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	client := domain.Client{
		Name:     request.Name,
		ModuleId: request.ModuleId,
		Result:   request.Result,
	}

	client = service.ClientRepository.Save(ctx, tx, client)

	return helper.ToClientResponse(client)
}
func (service *ClientService) Update(ctx context.Context, request web.ClientUpdateRequest) web.ClientResponse {
	err := service.Validate.Struct(request)
	helper.PanicIfError(err)

	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	client, err := service.ClientRepository.FindById(ctx, tx, request.Id)
	if err != nil {
		panic(exception.NewNotFoundError(err.Error()))
	}

	client.Name = request.Name
	client.ModuleId = request.ModuleId
	client.Result = request.Result

	client = service.ClientRepository.Save(ctx, tx, client)

	return helper.ToClientResponse(client)
}
func (service *ClientService) Delete(ctx context.Context, clientId int) {
	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	client, err := service.ClientRepository.FindById(ctx, tx, clientId)
	if err != nil {
		panic(exception.NewNotFoundError(err.Error()))
	}

	service.ClientRepository.Delete(ctx, tx, client)
}

func (service *ClientService) FindById(ctx context.Context, clientId int) web.ClientResponse {
	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	client, err := service.ClientRepository.FindById(ctx, tx, clientId)
	if err != nil {
		panic(exception.NewNotFoundError(err.Error()))
	}

	return helper.ToClientResponse(client)
}

func (service *ClientService) FindAll(ctx context.Context) []web.ClientResponse {
	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	clients := service.ClientRepository.FindAll(ctx, tx)
	helper.PanicIfError(err)
	return helper.ToClientResponses(clients)
}
