package redis

import (
	"context"
	"errors"
	"golang-rest-api/helper"
	"golang-rest-api/model/domain"
)

type ClientRepositoryImpl struct {
}

func NewClientRepository() ClientRepository {
	return &ClientRepositoryImpl{}
}

func (repository *ClientRepositoryImpl) Save(ctx context.Context, client domain.Client) domain.Client {
	SQL := "HSET client:? name ? module ?"
	result, err := tx.ExecContext(ctx, SQL, client.Name)
	helper.PanicIfError(err)
	id, err := result.LastInsertId()
	helper.PanicIfError(err)
	client.Id = int(id)
	return client
}

func (repository *ClientRepositoryImpl) Update(ctx context.Context, client domain.Client) domain.Client {
	SQL := "UPDATE client SET nama = ?, sensor_ph = ?,sensor_suhu = ? WHERE id = ?"
	_, err := tx.ExecContext(ctx, SQL, client.Name, client.Id)
	helper.PanicIfError(err)
	return client
}

func (repository *ClientRepositoryImpl) Delete(ctx context.Context, client domain.Client) {
	SQL := "DELETE FROM client where id = ?"
	_, err := tx.ExecContext(ctx, SQL, client.Id)
	helper.PanicIfError(err)
}

func (repository *ClientRepositoryImpl) FindById(ctx context.Context, clientId int) (domain.Client, error) {
	SQL := "SELECT id, nama, sensor_ph, sensor_suhu FROM client WHERE id = ?"
	rows, err := tx.QueryContext(ctx, SQL, clientId)
	helper.PanicIfError(err)
	defer rows.Close()

	client := domain.Client{}
	if rows.Next() {
		err = rows.Scan(&client.Id, &client.Name)
		helper.PanicIfError(err)
		return client, nil
	} else {
		return client, errors.New("client not found")
	}
}

func (repository *ClientRepositoryImpl) FindAll(ctx context.Context) []domain.Client {
	SQL := "SELECT id, nama, sensor_ph, sensor_suhu FROM client"
	rows, err := tx.QueryContext(ctx, SQL)
	helper.PanicIfError(err)
	defer rows.Close()

	var clients []domain.Client
	for rows.Next() {
		client := domain.Client{}
		rows.Scan(&client.Id, &client.Name)
		clients = append(clients, client)
	}
	return clients
}
