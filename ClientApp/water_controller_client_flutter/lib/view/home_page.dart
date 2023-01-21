import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_controller_client_flutter/provider/show_data_module_provider.dart';

import '../utility/result_state.dart';

class HomeViews extends StatelessWidget {
  static const routeName = '/home';
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Water Controller'),
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                size: 30.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/favorite');
              },
            ),
          ],
        ),
      ),
      body: Consumer<ShowDataModuleProvider>(builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child:
                      Image.asset('assets/amikom.png', width: 100, height: 100),
                ),
              ),
              Container(
                // height: Get.width / 2,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text("Output Sensor",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // height: Get.width / 2,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sensor Kelembapan",
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                        const SizedBox(height: 6),
                        Text(
                            state.list.data[(state.list.data.length) - 1].value,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 28.0,
                                color:
                                    Theme.of(context).colorScheme.secondary)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                // height: Get.width / 2,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text("Hasil",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary)),
              ),
              Container(
                // height: Get.width / 2,
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Text(
                    state.conditionalFunction(
                        state.list.data[(state.list.data.length) - 1].value),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                    )),
              ),
            ],
          );
        } else if (state.state == ResultState.noData) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: const Icon(Icons.add)),
    );
  }
}
