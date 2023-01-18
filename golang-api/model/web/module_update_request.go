package web

type ModuleUpdateRequest struct {
	Id    int    `json:"id" validate:"required"`
	Name  string `json:"name"`
	Value string `json:"value" validate:"numeric"`
}
