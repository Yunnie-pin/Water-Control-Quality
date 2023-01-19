package repository

import (
	"context"
	"database/sql"
	"golang-rest-api/model/domain"
)

type BaseClientRepository interface {
	Save(ctx context.Context, tx *sql.Tx, client domain.Client) domain.Client
	Update(ctx context.Context, tx *sql.Tx, client domain.Client) domain.Client
	Delete(ctx context.Context, tx *sql.Tx, client domain.Client)
	FindById(ctx context.Context, tx *sql.Tx, clientId int) (domain.Client, error)
	FindAll(ctx context.Context, tx *sql.Tx) []domain.Client
}

type BaseModuleRepository interface {
	Save(ctx context.Context, tx *sql.Tx, module domain.Module) domain.Module
	Update(ctx context.Context, tx *sql.Tx, module domain.Module) domain.Module
	Delete(ctx context.Context, tx *sql.Tx, module domain.Module)
	FindById(ctx context.Context, tx *sql.Tx, moduleId int) (domain.Module, error)
	FindAll(ctx context.Context, tx *sql.Tx) []domain.Module
}
