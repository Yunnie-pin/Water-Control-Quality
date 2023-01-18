package web

type ModuleCreateRequest struct {
	Name  string `json:"name" validate:"required,min=2,max=32"`
	Value string `json:"value" validate:"numeric"`
}
