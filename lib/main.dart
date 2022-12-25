import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeApp(),
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
      appBar: AppBar(
        title: const Text(
          'Calculator App',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                customTextButton('ebob'),
                customTextButton('ekok'),
                customTextButton('mod'),
                customTextButton('pow'),
              ],
            ),
            Row(
              children: [
                customTextButton('7'),
                customTextButton('8'),
                customTextButton('9'),
                customTextButton('+'),
              ],
            ),
            Row(
              children: [
                customTextButton('4'),
                customTextButton('5'),
                customTextButton('6'),
                customTextButton('-'),
              ],
            ),
            Row(
              children: [
                customTextButton('1'),
                customTextButton('2'),
                customTextButton('3'),
                customTextButton('x'),
              ],
            ),
            Row(
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
      child: TextButton(
        onPressed: () => buttonClick(value),
        child: Text(
          value,
          style: const TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }

  late int first;
  late int second;
  late String result;
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
    } else if (buttonText == "=") {
      second = int.parse(text);

      if (text == "+") {
        result = (first + second).toString();
      }
      if (text == "-") {
        result = (first - second).toString();
      }
      if (text == "x") {
        result = (first * second).toString();
      }
      if (text == "/") {
        result = (first ~/ second).toString();
      }
      // if (text == "ebob") {
      //   result = (first ~/ second).toString();
      // }
      // if (text == "ekok") {
      //   result = (first ~/ second).toString();
      // }
      // if (text == "mod") {
      //   result = (first ~/ second).toString();
      // }
      // if (text == "pow") {
      //   result = (first, second).toString();
      // }
    } else {
      result = int.parse(text + buttonText).toString();
    }

    setState(() {
      text = result;
    });
  }
}
