import 'package:flutter/material.dart';
import 'package:flutter_node_front/screen/create_screen.dart';
import 'package:flutter_node_front/screen/delete_screen.dart';
import 'package:flutter_node_front/screen/fetch_data_screen.dart';
import 'package:flutter_node_front/screen/update_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateScreen(),
                  ),
                );
              },
              child: const Text("CREATE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FetchDataScreen(),
                  ),
                );
              },
              child: const Text("READ"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpdateScreen(),
                  ),
                );
              },
              child: const Text("UPDATE"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeleteScreen(),
                  ),
                );
              },
              child: const Text("DELETE"),
            ),
          ],
        ),
      ),
    );
  }
}
