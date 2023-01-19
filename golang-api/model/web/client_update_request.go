package web

type ClientUpdateRequest struct {
	Id       int    `json:"id" validate:"required"`
	Name     string `json:"name"`
	ModuleId int    `json:"moduleId" validate:"numeric"`
}
