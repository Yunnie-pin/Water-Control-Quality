package web

type ClientCreateRequest struct {
	Nama       string  `json:"nama" validate:"required,min=2,max=32"`
	SensorPh   float32 `json:"sensorPh" validate:"numeric"`
	SensorSuhu float32 `json:"sensorSuhu" validate:"numeric"`
}
