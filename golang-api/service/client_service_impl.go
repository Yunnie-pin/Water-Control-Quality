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

type ClientServiceImpl struct {
	ClientRepository repository.ClientRepository
	DB               *sql.DB
	Validate         *validator.Validate
}

func NewClientService(ClientRepository repository.ClientRepository, DB *sql.DB, validate *validator.Validate) ClientService {
	return &ClientServiceImpl{
		ClientRepository: ClientRepository,
		DB:               DB,
		Validate:         validate,
	}
}

func (service *ClientServiceImpl) Create(ctx context.Context, request web.ClientCreateRequest) web.ClientResponse {
	err := service.Validate.Struct(request)
	helper.PanicIfError(err)

	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	client := domain.Client{
		Name: request.Name,
	}

	client = service.ClientRepository.Save(ctx, tx, client)

	return helper.ToClientResponse(client)
}
func (service *ClientServiceImpl) Update(ctx context.Context, request web.ClientUpdateRequest) web.ClientResponse {
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

	client = service.ClientRepository.Save(ctx, tx, client)

	return helper.ToClientResponse(client)
}
func (service *ClientServiceImpl) Delete(ctx context.Context, clientId int) {
	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	client, err := service.ClientRepository.FindById(ctx, tx, clientId)
	if err != nil {
		panic(exception.NewNotFoundError(err.Error()))
	}

	service.ClientRepository.Delete(ctx, tx, client)

}

func (service *ClientServiceImpl) FindById(ctx context.Context, clientId int) web.ClientResponse {
	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	client, err := service.ClientRepository.FindById(ctx, tx, clientId)
	if err != nil {
		panic(exception.NewNotFoundError(err.Error()))
	}

	return helper.ToClientResponse(client)
}

func (service *ClientServiceImpl) FindAll(ctx context.Context) []web.ClientResponse {
	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	clients := service.ClientRepository.FindAll(ctx, tx)
	helper.PanicIfError(err)
	return helper.ToClientResponses(clients)
}
