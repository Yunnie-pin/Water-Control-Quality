package web

type ClientUpdateRequest struct {
	Id     int    `json:"id" validate:"required"`
	Name   string `json:"name"`
	Module string `json:"module" validate:"unique"`
}
