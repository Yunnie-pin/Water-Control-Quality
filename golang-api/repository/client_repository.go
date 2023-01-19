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
	SQL := `SET @name := '?';
	SET @module_id := ?;
	SET @result := '?';
	INSERT INTO clients(name,module_id,result,created_at,updated_at) 
	VALUES 
	(@name,
	 IF(@module_id <=> 0,NULL,@module_id),
	 IF(@result <=> '',NULL,@result)
	 ,NOW(),NOW());`
	result, err := tx.ExecContext(ctx, SQL, client.Name, client.ModuleId, client.Result)
	helper.PanicIfError(err)
	id, err := result.LastInsertId()
	helper.PanicIfError(err)
	client.Id = int(id)
	return client
}

func (repository *ClientRepository) Update(ctx context.Context, tx *sql.Tx, client domain.Client) domain.Client {
	SQL := `SET @name := '?';
	SET @module_id := ?;
	SET @result := '?';
	UPDATE clients 
	SET name = IF(@name <> '',@name, name),
	module_id = IF(@module_id <=> 0,NULL, @module_id),
	result = IF(@result <> '', @result, result), 
	updated_at = NOW() 
	WHERE id = ?;`
	_, err := tx.ExecContext(ctx, SQL, client.Name, client.ModuleId, client.Result, client.Id)
	helper.PanicIfError(err)
	return client
}

func (repository *ClientRepository) Delete(ctx context.Context, tx *sql.Tx, client domain.Client) {
	SQL := "DELETE FROM clients where id = ?"
	_, err := tx.ExecContext(ctx, SQL, client.Id)
	helper.PanicIfError(err)
}

func (repository *ClientRepository) FindById(ctx context.Context, tx *sql.Tx, clientId int) (domain.Client, error) {
	SQL := "SELECT id, name, module_id, result, created_at, updated_at FROM clients WHERE id = ?"
	rows, err := tx.QueryContext(ctx, SQL, clientId)
	helper.PanicIfError(err)
	defer rows.Close()

	client := domain.Client{}
	if rows.Next() {
		err = rows.Scan(&client.Id, &client.Name, &client.ModuleId, &client.Result, &client.CreatedAt, &client.UpdatedAt)
		helper.PanicIfError(err)
		return client, nil
	} else {
		return client, errors.New("client not found")
	}
}

func (repository *ClientRepository) FindAll(ctx context.Context, tx *sql.Tx) []domain.Client {
	SQL := "SELECT id, name, module_id, result, created_at, updated_at FROM clients"
	rows, err := tx.QueryContext(ctx, SQL)
	helper.PanicIfError(err)
	defer rows.Close()

	var clients []domain.Client
	for rows.Next() {
		client := domain.Client{}
		rows.Scan(&client.Id, &client.Name, &client.ModuleId, &client.Result, &client.CreatedAt, &client.UpdatedAt)
		clients = append(clients, client)
	}
	return clients
}
