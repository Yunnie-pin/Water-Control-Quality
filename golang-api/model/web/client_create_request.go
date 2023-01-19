package web

type ClientCreateRequest struct {
	Name     string `json:"name" validate:"required,min=2,max=32"`
	ModuleId int    `json:"module" validate:"numeric"`
}
