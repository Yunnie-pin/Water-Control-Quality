package web

type ModuleUpdateRequest struct {
	Id    int     `json:"id" validate:"required"`
	Name  string  `json:"name" validate:"required,min=2,max=32"`
	Value float64 `json:"value" validate:"numeric"`
}
