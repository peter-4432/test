import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// This is the main widget for the app. It creates a simple layout made up of
// text, a button, and an internet image, all aligned at the center.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Flutter App"),
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            // Everything below will appear one above the next
            children: [
              Text(
                "Welcome to my app!",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  // The message will show inside the debug console when the button is tapped
                  print("You clicked the button!");
                },
                child: Text("Press Me"),
              ),

              SizedBox(height: 20),

              // This loads an image directly from the internet
              Image.network(
                "https://via.placeholder.com/150",
                width: 150,
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
