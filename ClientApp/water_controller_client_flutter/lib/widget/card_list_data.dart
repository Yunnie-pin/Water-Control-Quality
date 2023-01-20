import 'package:flutter/material.dart';

import '../models/list_data_client.dart';

Padding cardListDataClient(Datum data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ExpansionTile(
      backgroundColor: Colors.white,
      title: Text(data.name),
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
                          data.module.value,
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
                      data.module.value,
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
}
