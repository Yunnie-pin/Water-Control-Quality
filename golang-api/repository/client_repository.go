package repository

import (
	"context"
	"database/sql"
	"errors"
	"golang-rest-api/helper"
	"golang-rest-api/model/domain"
)

type ClientRepository struct {
}

func NewClientRepository() BaseClientRepository {
	return &ClientRepository{}
}

func (repository *ClientRepository) Save(ctx context.Context, tx *sql.Tx, client domain.Client) domain.Client {
	SQL := "INSERT INTO client(name,module) VALUES (?,?)"
	result, err := tx.ExecContext(ctx, SQL, client.Name, client.Module)
	helper.PanicIfError(err)
	id, err := result.LastInsertId()
	helper.PanicIfError(err)
	client.Id = int(id)
	return client
}

func (repository *ClientRepository) Update(ctx context.Context, tx *sql.Tx, client domain.Client) domain.Client {
	SQL := "UPDATE client SET name = ?, module = ? WHERE id = ?"
	_, err := tx.ExecContext(ctx, SQL, client.Name, client.Module, client.Id)
	helper.PanicIfError(err)
	return client
}

func (repository *ClientRepository) Delete(ctx context.Context, tx *sql.Tx, client domain.Client) {
	SQL := "DELETE FROM client where id = ?"
	_, err := tx.ExecContext(ctx, SQL, client.Id)
	helper.PanicIfError(err)
}

func (repository *ClientRepository) FindById(ctx context.Context, tx *sql.Tx, clientId int) (domain.Client, error) {
	SQL := "SELECT id, name, module FROM client WHERE id = ?"
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

func (repository *ClientRepository) FindAll(ctx context.Context, tx *sql.Tx) []domain.Client {
	SQL := "SELECT id, nama, module FROM client"
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
