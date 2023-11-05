import 'package:flutter/material.dart';

import '../services/api.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final TextEditingController _nameTextEditingController =
      TextEditingController();
  final TextEditingController _priceTextEditingController =
      TextEditingController();
  final TextEditingController _descTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameTextEditingController,
              decoration: const InputDecoration(
                hintText: "name here",
              ),
            ),
            TextField(
              controller: _priceTextEditingController,
              decoration: const InputDecoration(
                hintText: "price here",
              ),
            ),
            TextField(
              controller: _descTextEditingController,
              decoration: const InputDecoration(
                hintText: "desc here",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                var data = {
                  "pname": _nameTextEditingController.text,
                  "pprice": _priceTextEditingController.text,
                  "pdesc": _descTextEditingController.text,
                };

                Api.addproduct(data);
              },
              child: const Text('Create Data'),
            ),
          ],
        ),
      ),
    );
  }
}
