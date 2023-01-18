package app

import (
	"database/sql"
	"fmt"
	"golang-rest-api/helper"
	"log"
	"os"
	"time"

	"github.com/joho/godotenv"
)

func NewDB() *sql.DB {
	err := godotenv.Load(".env")

	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Load Env Variable
	host := os.Getenv("DB_HOST")
	port := os.Getenv("DB_PORT")
	username := os.Getenv("DB_USERNAME")
	password := os.Getenv("DB_PASSWORD")
	database := os.Getenv("DB_DATABASE")

	var db *sql.DB
	if len(password) > 0 {
		db, err = sql.Open("mysql", fmt.Sprintf("%s:%s@tcp(%s:%s)/%s", username, password, host, port, database))
	} else {
		db, err = sql.Open("mysql", fmt.Sprintf("%s@tcp(%s:%s)/%s", username, host, port, database))
	}

	helper.PanicIfError(err)

	db.SetMaxIdleConns(5)
	db.SetMaxOpenConns(20)
	db.SetConnMaxLifetime(60 * time.Minute)
	db.SetConnMaxIdleTime(10 * time.Minute)

	return db
}
