import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    Center(child: Text('Index 0: Home', style: TextStyle(fontSize: 30))),
    Center(child: Text('Index 1: Business', style: TextStyle(fontSize: 30))),
    Center(child: Text('Index 2: School', style: TextStyle(fontSize: 30))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: _widgetOptions[_selectedIndex],
        persistentFooterButtons: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), // Pill shape
                    ),
                    onPressed: () => _onItemTapped(0),
                    child: const Text('Option 1'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), // Pill shape
                    ),
                    onPressed: () => _onItemTapped(1),
                    child: const Text('Option 2'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), // Pill shape
                    ),
                    onPressed: () => _onItemTapped(2),
                    child: const Text('Option 3'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), // Pill shape
                    ),
                    onPressed: () {
                      // Action for button 4
                    },
                    child: const Text('Option 4'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), // Pill shape
                    ),
                    onPressed: () {
                      // Action for button 5
                    },
                    child: const Text('Option 5'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), // Pill shape
                    ),
                    onPressed: () {
                      // Action for button 6
                    },
                    child: const Text('Option 6'),
                  ),
                ),
                // Add more buttons as needed
              ],
            ),
          )
        ],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.upload_file),
                onPressed: () {
                  // Action for left button
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    child: TextField(
                      textAlign: TextAlign.left,
                      minLines: 1, // Set minimum lines to display
                      maxLines: null, // Allow the text field to expand indefinitely
                      decoration: InputDecoration(
                        hintText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0), // Reduced vertical padding
                      ),
                      style: TextStyle(
                        fontSize: 14.0, // Optional: Adjust font size if needed
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.mic),
                onPressed: () {
                  // Action for right button
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}