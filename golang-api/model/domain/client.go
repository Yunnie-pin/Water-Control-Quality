package domain

import "time"

type Client struct {
	Id        int
	Name      string
	Result    string
	ModuleId  int
	CreatedAt time.Time
	UpdatedAt time.Time
}
