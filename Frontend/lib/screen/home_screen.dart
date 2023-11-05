import 'package:flutter/material.dart';
import 'package:flutter_node_front/screen/create_screen.dart';

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
              onPressed: () {},
              child: const Text("READ"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("UPDATE"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("DELETE"),
            ),
          ],
        ),
      ),
    );
  }
}
