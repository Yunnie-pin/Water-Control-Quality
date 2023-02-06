
# Water Controller IoT

Project water controller IoT ini menggunakan sensor kelembapan  untuk memonitor kondisi air/tanah dalam sebuah wadah. Data dari sensor diterima oleh perangkat IoT yang terhubung ke internet, kemudian diolah dan ditampilkan pada aplikasi mobile menggunakan Flutter. Aplikasi ini juga memiliki fitur untuk mengontrol aliran air berdasarkan kondisi yang dideteksi oleh sensor. Backend dari aplikasi ini dikelola menggunakan Laravel, yang digunakan untuk mengelola koneksi antara perangkat IoT dan aplikasi mobile, serta untuk menyimpan data dari sensor.



## Installation

Install Hijrah Journey 


```bash
  git clone https://github.com/Yunnie-pin/Water-Control-Quality
  cd Water-Control-Quality/ClientApp/water_controller_client_flutter/
  flutter pub get
  flutter run
  
  //Build Apk
  flutter build apk --release
```


## Tech

**Client:** 
- Flutter
- Dart

**Server:**
- Laravel





| Dashboard | Add-page | List Page |
| ----------- | ----------- | -------- |
| ![Dashboard](https://i.imgur.com/uD7tL2q.jpg) | ![Add-page](https://i.imgur.com/ZwXiePe.jpg) | ![List Page](https://i.imgur.com/7lxgmMe.jpg) |
