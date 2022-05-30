import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

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
      drawer: MyDrawer(),
    );
  }
}
