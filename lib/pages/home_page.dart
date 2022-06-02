import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'package:flutter_catalog/models/products.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items =
        List.from(productsData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final int days = 30;
    final String name = "MyCodeWorks";

    return Scaffold(
      appBar: AppBar(
        title: Text("MyCodeWorks"),
      ),
      body: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
          ? ListView.builder(
              itemCount: CatalogModel.items.length,
              itemBuilder: (context, index) {
                return ItemWidget(
                  item: CatalogModel.items[index],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: MyDrawer(),
    );
  }
}
