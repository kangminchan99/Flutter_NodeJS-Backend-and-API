import 'package:flutter/material.dart';
import 'package:flutter_node_front/model/product_model.dart';
import 'package:flutter_node_front/services/api.dart';

import 'edit_screen.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('update operation'),
      ),
      body: FutureBuilder(
        future: Api.getProduct(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Product> pdata = snapshot.data;
            return ListView.builder(
                itemCount: pdata.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.storage),
                    title: Text("${pdata[index].name}"),
                    subtitle: Text("${pdata[index].desc}"),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditScreen(data: pdata[index]),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
