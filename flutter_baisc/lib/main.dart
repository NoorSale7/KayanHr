import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ---------- StatelessWidget ----------
// No internal state. Doesn't change once built.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // BuildContext (context) tells this widget where it sits in the widget tree
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

// ---------- StatefulWidget ----------
// Has internal state (the counter) that changes over time.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0; // this is the "state"

  void _incrementCounter() {
    setState(() {
      // setState tells Flutter: "rebuild this widget, state changed"
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold = basic screen structure (app bar + body)
      appBar: AppBar(
        title: const Text(' Week 3 Demo '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding widget
        child: Column(
          // Column = arrange children vertically
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image widget (loaded from assets/)
            Image.asset(
              'images/flutter.png',
              width: 100,
              height: 100,
            ),

            const SizedBox(height: 20),

            // Card widget = styled container with shadow
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  // Row = arrange children horizontally
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.info, color: Colors.blue), // Icon
                    const Text('Counter Value:'), // Text
                    Expanded(
                      // Expanded = fill remaining space in Row/Column
                      child: Text(
                        '$_counter',
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Stack = layer widgets on top of each other
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const Icon(Icons.star, color: Colors.white, size: 40),
              ],
            ),

            const SizedBox(height: 20),

            // Button widget
            ElevatedButton(
              onPressed: _incrementCounter, // triggers setState
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}