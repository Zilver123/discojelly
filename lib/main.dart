import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  TextEditingController _controller = TextEditingController();
  String _responseText = 'Index 0: Home';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _sendInput(String input) async {
    print('Sending input: ' + input);
    try {
      final response = await http.post(
        Uri.parse('https://discojelly-backend.onrender.com/process-input'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user_input': input,
        }),
      );
      print('Response status: ' + response.statusCode.toString());
      print('Response body: ' + response.body);
      if (response.statusCode == 200) {
        setState(() {
          _responseText = response.body;
          _controller.clear();
        });
      } else {
        print('Failed to get a valid response');
      }
    } catch (e) {
      print('Error occurred: ' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = [
      Center(child: Text(_responseText, style: TextStyle(fontSize: 30))),
      Center(child: Text('Index 1: Business', style: TextStyle(fontSize: 30))),
      Center(child: Text('Index 2: School', style: TextStyle(fontSize: 30))),
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: widgetOptions[_selectedIndex],
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
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          textAlign: TextAlign.left,
                          minLines: 1,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          textInputAction: TextInputAction.done,
                          onSubmitted: (String input) async {
                            await _sendInput(input);
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () async {
                          await _sendInput(_controller.text);
                        },
                      ),
                    ],
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