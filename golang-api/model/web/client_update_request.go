package web

type ClientUpdateRequest struct {
	Id       int    `json:"id" validate:"required"`
	Name     string `json:"name"`
	Result   string `json:"result"`
	ModuleId int    `json:"module_id" validate:"numeric"`
}
