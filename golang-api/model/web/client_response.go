package web

type ClientResponse struct {
	Id       int    `json:"id"`
	Name     string `json:"name"`
	ModuleId int    `json:"moduleId"`
}
