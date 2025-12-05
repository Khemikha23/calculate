import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CalculatorUI(),
    );
  }
}

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({super.key});

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  String displayText = "0";
  String input = "";

  void onButtonPress(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        displayText = "0";
      } else {
        input += value;
        displayText = input;
      }
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onButtonPress(text),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 22),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 19, 22, 24), Color.fromARGB(255, 19, 22, 24)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(20),
                child: Text(
                  displayText,
                  style: const TextStyle(color: Colors.white, fontSize: 60),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: Column(
                  children: [
                    Row(
                      children: [
                        buildButton("7", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("8", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("9", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("/", const Color.fromARGB(255, 181, 120, 29)),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton("4", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("5", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("6", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("*", const Color.fromARGB(255, 181, 120, 29)),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton("1", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("2", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("3", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("-", const Color.fromARGB(255, 181, 120, 29)),
                      ],
                    ),
                    Row(
                      children: [
                        buildButton("0", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("%", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("C", const Color.fromARGB(255, 47, 49, 52)),
                        buildButton("++", const Color.fromARGB(255, 181, 120, 29)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: ElevatedButton(
                              onPressed: () => onButtonPress("="),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 22),
                                backgroundColor: const Color.fromARGB(255, 181, 120, 29),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                "=",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
