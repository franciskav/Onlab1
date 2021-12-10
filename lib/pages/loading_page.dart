import 'package:flutter/material.dart';
import 'package:onlab1/components/appBar/gradient_background.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Loading Page"),
          flexibleSpace: const GradientBackground()),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
            ],
          ),
        ),
      ),
    );
  }

}