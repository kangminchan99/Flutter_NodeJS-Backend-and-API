import 'package:flutter/material.dart';
import 'package:flutter_node_front/model/product_model.dart';
import 'package:flutter_node_front/services/api.dart';

class EditScreen extends StatefulWidget {
  final Product data;
  const EditScreen({required this.data, super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descController.text = widget.data.desc.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "name here"),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(hintText: "price here"),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(hintText: "desc here"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Api.updateProduct(widget.data.id, {
                  "pname": nameController.text,
                  "pdesc": descController.text,
                  "pprice": priceController.text,
                  "id": widget.data.id
                });
              },
              child: const Text('update Data'),
            ),
          ],
        ),
      ),
    );
  }
}
