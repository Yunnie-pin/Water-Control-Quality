package web

type ModuleCreateRequest struct {
	Name  string  `json:"name" validate:"required,min=2,max=32"`
	Value float64 `json:"value" validate:"numeric"`
}
