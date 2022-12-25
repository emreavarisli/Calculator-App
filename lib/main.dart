import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
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
        title: const Text('Calculator App'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: const Text(
                  '0',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                customOutlineButton('9'),
                customOutlineButton('8'),
                customOutlineButton('7'),
                customOutlineButton('+'),
              ],
            ),
            Row(
              children: [
                customOutlineButton('4'),
                customOutlineButton('5'),
                customOutlineButton('6'),
                customOutlineButton('-'),
              ],
            ),
            Row(
              children: [
                customOutlineButton('1'),
                customOutlineButton('2'),
                customOutlineButton('3'),
                customOutlineButton('x'),
              ],
            ),
            Row(
              children: [
                customOutlineButton('C'),
                customOutlineButton('0'),
                customOutlineButton('='),
                customOutlineButton('/'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget customOutlineButton(String value) {
    return
        //padding: const EdgeInsets.all(25),
        TextButton(
      onPressed: () {},
      child: Text(
        value,
        style: const TextStyle(fontSize: 30.0),
      ),
    );
  }
}
