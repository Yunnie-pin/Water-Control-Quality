import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:water_controller_client_flutter/provider/delete_client_provider.dart'
    as delete_client;

import '../api/api_client.dart';
import '../models/list_data_client.dart';

Padding cardListDataClient(Datum data, BuildContext context) {
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
        Consumer<delete_client.DeleteClientProvider>(
            builder: (context, state, _) {
          return Padding(
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
          );
        }),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.confirm,
                    title: 'Update ${data.name}',
                    text:
                        'Apakah kamu yakin ingin memperbaharui data ${data.name}',
                    confirmBtnText: 'Yes',
                    cancelBtnText: 'No',
                    confirmBtnColor: Colors.green,
                  );
                },
                child: const Text('Update'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                  child: const Text("Delete"),
                  onPressed: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                      title: 'Delete ${data.name}',
                      text:
                          'Apakah kamu yakin ingin menghapus data ${data.name}',
                      confirmBtnText: 'Yes',
                      cancelBtnText: 'No',
                      confirmBtnColor: Colors.green,
                      onConfirmBtnTap: () {
                        delete_client.DeleteClientProvider(
                                apiService: ApiService())
                            .submitDeleteClient(data.id.toString())
                            .then(
                          (value) {
                            if (value.data == 1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Gagal Menghapus data')),
                              );
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Berhasil menghapus data'),
                                ),
                              );
                              Navigator.pop(context);
                            }
                          },
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ],
    ),
  );
}
