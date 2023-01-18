package web

type ClientCreateRequest struct {
	Name   string `json:"name" validate:"required,min=2,max=32"`
	Module string `json:"module" validate:"unique"`
}
