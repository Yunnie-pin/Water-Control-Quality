package web

type ClientCreateRequest struct {
	Nama       string  `validate:"required,alpha,min=2,max=32"`
	SensorPh   float32 `validate:"numeric"`
	SensorSuhu float32 `validate:"numeric"`
}
