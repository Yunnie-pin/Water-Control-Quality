import 'package:flutter/material.dart';

Widget homePageLoadingPage(BuildContext context) {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Image.asset('assets/amikom.png', width: 100, height: 100),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('Sedang memperbarui data...'),
              Center(child: CircularProgressIndicator()),
            ],
          ),
        ],
      ));
}
