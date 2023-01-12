import 'package:flutter/material.dart';

class SavedPages extends StatelessWidget {
  const SavedPages({super.key});

  @override
  Widget build(BuildContext context) {
    var listData = [
      {
        "id": 1,
        "nama": "Tanah Pak kusir",
        "sensor1": 172.12,
        "sensor2": 73.12,
        "hasil": "Hasilnya Mantap"
      },
      {
        "id": 2,
        "nama": "Tanah Pak Candra",
        "sensor1": 172.12,
        "sensor2": 73.12,
        "hasil": "Hasilnya tidak Mantap"
      },
      {
        "id": 3,
        "nama": "Tanah Pak Indra",
        "sensor1": 172.12,
        "sensor2": 73.12,
        "hasil": "Hasilnya Kurang Mantap"
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('List Data'),
      ),
      body: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                backgroundColor: Colors.white,
                title: Text(listData[index]["nama"].toString()),
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Center(
                                    child: Text(
                                      "Sensor1",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    listData[index]["sensor1"].toString(),
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Center(
                                    child: Text(
                                      "Sensor2",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    listData[index]["sensor2"].toString(),
                                    textAlign: TextAlign.justify,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Center(
                                child: Text(
                                  "Hasil",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                listData[index]["hasil"].toString(),
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: null,
                          child: Text('Update'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: null,
                          child: Text('Delete'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
