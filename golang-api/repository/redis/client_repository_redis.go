package redis

import (
	"context"
	"golang-rest-api/model/domain"
)

type ClientRepository interface {
	Save(ctx context.Context, client domain.Client) domain.Client
	Update(ctx context.Context, client domain.Client) domain.Client
	Delete(ctx context.Context, client domain.Client)
	FindById(ctx context.Context, clientId int) (domain.Client, error)
	FindAll(ctx context.Context) []domain.Client
}
