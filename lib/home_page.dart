import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "MyCodeWorks";

    return Scaffold(
      appBar: AppBar(
        title: Text("MyCodeWorks"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome $days To  $name"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
