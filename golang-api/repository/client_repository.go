package repository

import (
	"context"
	"database/sql"
	"golang-rest-api/model/domain"
)

type ClientRepository interface {
	Save(ctx context.Context, tx *sql.Tx, client domain.Client) domain.Client
	Update(ctx context.Context, tx *sql.Tx, client domain.Client) domain.Client
	Delete(ctx context.Context, tx *sql.Tx, client domain.Client)
	FindById(ctx context.Context, tx *sql.Tx, clientId int) (domain.Client, error)
	FindAll(ctx context.Context, tx *sql.Tx) []domain.Client
}
