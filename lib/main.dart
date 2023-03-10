import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Calculator App', 
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customTextButton('7'),
                customTextButton('8'),
                customTextButton('9'),
                customTextButton('+'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customTextButton('4'),
                customTextButton('5'),
                customTextButton('6'),
                customTextButton('-'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customTextButton('1'),
                customTextButton('2'),
                customTextButton('3'),
                customTextButton('x'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                customTextButton('C'),
                customTextButton('0'),
                customTextButton('='),
                customTextButton('/'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextButton(String value) {
    return SizedBox(
      width: 100,
      height: 100,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          shadowColor: Colors.green,
        ),
        onPressed: () => buttonClick(value),
        child: Text(
          value,
          style: const TextStyle(fontSize: 45.0, color: Colors.green),
        ),
      ),
    );
  }

  late int first;
  late int second;
  late String result;
  String operation = '';
  String text = '';

  void buttonClick(String buttonText) {
    if (buttonText == 'C') {
      result = '';
      text = '';
      first = 0;
      second = 0;
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      first = int.parse(text);
      result = '';
      operation = buttonText;
    } else if (buttonText == "=") {
      second = int.parse(text);

      if (operation == "+") {
        result = (first + second).toString();
      }
      if (operation == "-") {
        result = (first - second).toString();
      }
      if (operation == "x") {
        result = (first * second).toString();
      }
      if (operation == "/") {
        result = (first / second).toString();
      }
    } else {
      result = int.parse(text + buttonText).toString();
    }

    setState(() {
      text = result;
    });
  }
}
