import 'package:flutter/material.dart';

class AddDataPages extends StatefulWidget {
  const AddDataPages({super.key});

  @override
  State<AddDataPages> createState() => _AddDataPagesState();
}

class _AddDataPagesState extends State<AddDataPages> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Tambahkan ke Database"),
        ),
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                // tambahkan komponen seperti input field disini
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "contoh: Tanah Gambut pak Tono",
                      labelText: "Nama Lokasi",
                      icon: const Icon(Icons.place),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                const Text(
                  "Sensor Kelembapan : 120",
                ),
                const Text(
                  "Hasil : Mantap",
                ),

                const SizedBox(height: 20),
                const Text(
                  "#Data yang dimasukkan adalah data yang paling terbaru saat ini",
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
