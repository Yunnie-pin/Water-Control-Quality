package domain

import "time"

type Module struct {
	Id        int
	Name      string
	Value     float64
	CreatedAt time.Time
	UpdatedAt time.Time
}
