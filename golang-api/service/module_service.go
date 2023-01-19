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

type ModuleService struct {
	ModuleRepository repository.BaseModuleRepository
	DB               *sql.DB
	Validate         *validator.Validate
}

// func NewModuleService(ModuleRepository repository.BaseModuleRepository, DB *sql.DB, validate *validator.Validate) BaseModuleService {
// 	return &ModuleService{
// 		ModuleRepository: ModuleRepository,
// 		DB:               DB,
// 		Validate:         validate,
// 	}
// }

func (service *ModuleService) Create(ctx context.Context, request web.ModuleCreateRequest) web.ModuleResponse {
	err := service.Validate.Struct(request)
	helper.PanicIfError(err)

	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	module := domain.Module{
		Name:  request.Name,
		Value: request.Value,
	}

	module = service.ModuleRepository.Save(ctx, tx, module)

	return helper.ToModuleResponse(module)
}
func (service *ModuleService) Update(ctx context.Context, request web.ModuleUpdateRequest) web.ModuleResponse {
	err := service.Validate.Struct(request)
	helper.PanicIfError(err)

	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	module, err := service.ModuleRepository.FindById(ctx, tx, request.Id)
	if err != nil {
		panic(exception.NewNotFoundError(err.Error()))
	}
	module.Name = request.Name
	module.Value = request.Value

	module = service.ModuleRepository.Save(ctx, tx, module)

	return helper.ToModuleResponse(module)
}
func (service *ModuleService) Delete(ctx context.Context, moduleId int) {
	tx, err := service.DB.Begin()
	helper.PanicIfError(err)
	defer helper.CommitOrRollback(tx)

	module, err := service.ModuleRepository.FindById(ctx, tx, moduleId)
	if err != nil {
		panic(exception.NewNotFoundError(err.Error()))
	}

	service.ModuleRepository.Delete(ctx, tx, module)
}
func (service *ModuleService) FindById(ctx context.Context, moduleId int) web.ModuleResponse {
	panic("err")
}
func (service *ModuleService) FindAll(ctx context.Context) []web.ModuleResponse {
	panic("err")
}
