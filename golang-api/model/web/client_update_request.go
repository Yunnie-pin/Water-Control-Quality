package web

type ClientUpdateRequest struct {
	Id     int    `validate:"required"`
	Name   string `json:"name" validate:"required,alpha,min=2,max=32"`
	Module string `json:"module" validate:"json"`
}
