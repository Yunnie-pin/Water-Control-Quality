import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:water_controller_client_flutter/provider/list_data_client_provider.dart';
import 'package:water_controller_client_flutter/widget/card_list_data.dart';

import '../utility/result_state.dart';

class SavedPages extends StatelessWidget {
  const SavedPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Data'),
      ),
      body: Consumer<ListDataClientProvider>(builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.list.data.length,
              itemBuilder: (context, index) {
                var data = state.list.data[index];
                return cardListDataClient(data);
              });
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
    );
  }
}
