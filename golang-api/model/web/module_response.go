package web

type ModuleResponse struct {
	Id        int     `json:"id"`
	Name      string  `json:"name"`
	Value     float64 `json:"value"`
	CreatedAt string  `json:"created_at"`
	UpdatedAt string  `json:"updated_at"`
}
