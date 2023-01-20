package repository

import (
	"context"
	"database/sql"
	"errors"
	"golang-rest-api/helper"
	"golang-rest-api/model/domain"
	"time"
)

type ModuleRepository struct {
}

func NewModuleRepository() BaseModuleRepository {
	return &ModuleRepository{}
}

func (repository *ModuleRepository) Save(ctx context.Context, tx *sql.Tx, module domain.Module) domain.Module {
	SQL := "INSERT INTO modules(name,value, created_at, updated_at) VALUES (?,?,?,?)"
	result, err := tx.ExecContext(ctx, SQL, module.Name, module.Value, time.Now(), time.Now())
	helper.PanicIfError(err)
	id, err := result.LastInsertId()
	helper.PanicIfError(err)
	module.Id = int(id)
	return module
}

func (repository *ModuleRepository) Update(ctx context.Context, tx *sql.Tx, module domain.Module) domain.Module {
	SQL := "UPDATE modules SET name = ?, value = ?, updated_at = ? WHERE id = ?"
	_, err := tx.ExecContext(ctx, SQL, module.Name, module.Value, time.Now(), module.Id)
	helper.PanicIfError(err)
	return module
}

func (repository *ModuleRepository) Delete(ctx context.Context, tx *sql.Tx, module domain.Module) {
	SQL := "DELETE FROM modules where id = ?"
	_, err := tx.ExecContext(ctx, SQL, module.Id)
	helper.PanicIfError(err)
}

func (repository *ModuleRepository) FindById(ctx context.Context, tx *sql.Tx, moduleId int) (domain.Module, error) {
	SQL := "SELECT id, name, value, created_at, updated_at FROM modules WHERE id = ?"
	rows, err := tx.QueryContext(ctx, SQL, moduleId)
	helper.PanicIfError(err)
	defer rows.Close()

	module := domain.Module{}
	if rows.Next() {
		err = rows.Scan(&module.Id, &module.Name, &module.Value, &module.CreatedAt, &module.UpdatedAt)
		helper.PanicIfError(err)
		return module, nil
	} else {
		return module, errors.New("client not found")
	}
}

func (repository *ModuleRepository) FindAll(ctx context.Context, tx *sql.Tx) []domain.Module {
	SQL := "SELECT id, name, value, created_at, updated_at FROM modules"
	rows, err := tx.QueryContext(ctx, SQL)
	helper.PanicIfError(err)
	defer rows.Close()

	var modules []domain.Module
	for rows.Next() {
		module := domain.Module{}
		rows.Scan(&module.Id, &module.Name, &module.Value, &module.CreatedAt, &module.UpdatedAt)
		modules = append(modules, module)
	}
	return modules
}
