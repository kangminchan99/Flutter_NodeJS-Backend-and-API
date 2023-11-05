import 'package:flutter/material.dart';
import 'package:flutter_node_front/model/product_model.dart';

import '../services/api.dart';

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({super.key});

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> pdata = snapshot.data;
            return ListView.builder(
              itemCount: pdata.length,
              itemBuilder: (context, int index) {
                return ListTile(
                  leading: const Icon(Icons.storage),
                  title: Text("${pdata[index].name}"),
                  subtitle: Text("${pdata[index].desc}"),
                  trailing: Text("\$ ${pdata[index].price}"),
                );
                //
              },
            );
          }
        },
      ),
    );
  }
}
