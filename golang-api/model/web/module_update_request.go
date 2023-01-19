package web

type ModuleUpdateRequest struct {
	Id    int     `json:"id" validate:"required"`
	Name  string  `json:"name"`
	Value float64 `json:"value" validate:"numeric"`
}
