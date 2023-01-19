package web

type ClientResponse struct {
	Id        int    `json:"id"`
	Name      string `json:"name"`
	Result    string `json:"result"`
	ModuleId  int    `json:"module_id"`
	CreatedAt string `json:"created_at"`
	UpdatedAt string `json:"updated_at"`
}
