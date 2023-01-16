package web

type ClientResponse struct {
	Id         int     `json:"id"`
	Nama       string  `json:"nama"`
	SensorPh   float32 `json:"sensorPh"`
	SensorSuhu float32 `json:"sensorSuhu"`
}
