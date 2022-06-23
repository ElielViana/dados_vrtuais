import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size screen;
  String? img1 = 'assets/images/dado5.png', img2 = 'assets/images/dado5.png';

  sorteiaDado() {
    var rng = Random();
    for (var i = 1; i < 3; i++) {
      debugPrint(rng.nextInt(6).toString());
      setState(() {
        i == 1
            ? img1 = 'assets/images/dado${rng.nextInt(6)}.png'
            : img2 = 'assets/images/dado${rng.nextInt(6)}.png';
      });
      debugPrint(img1);
      debugPrint(img2);
    }
  }

  @override
  void initState() {
    sorteiaDado();
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Dados virtuais',
            ),
          ],
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () {
                sorteiaDado();
              },
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(img1!),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                sorteiaDado();
              },
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      img2!,
                    ),
                  ),
                ),
              ),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
