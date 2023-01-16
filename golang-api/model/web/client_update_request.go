package web

type ClientUpdateRequest struct {
	Id         int     `validate:"required"`
	Nama       string  `json:"nama" validate:"required,alpha,min=2,max=32"`
	SensorPh   float32 `json:"sensorPh" validate:"numeric"`
	SensorSuhu float32 `json:"sensorSuhu" validate:"numeric"`
}
