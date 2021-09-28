import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var liLuNum = new List.filled(6, 0);

  @override
  void initState() {
    super.initState();
  }

  void btnTaped() {
    setState(() {
      for (int i = 0; i < 6; i++) {
        bool randomState = true;
        while (randomState) {
          randomState = false;
          liLuNum[i] = Random().nextInt(55);
          for (int j = i - 1; j >= 0; j--) {
            if (liLuNum[i] == liLuNum[j]) {
              randomState = !randomState;
              break;
            }
          }
        }
      }
    });
  }

  Column _buildButtonColumn(String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(5),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Colors.red,
            ),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 3),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello World App',
        home: Scaffold(
          appBar: AppBar(title: Text('Hello app')),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButtonColumn(liLuNum[0].toString().padLeft(2, '0')),
                  _buildButtonColumn(liLuNum[1].toString().padLeft(2, '0')),
                  _buildButtonColumn(liLuNum[2].toString().padLeft(2, '0')),
                  _buildButtonColumn(liLuNum[3].toString().padLeft(2, '0')),
                  _buildButtonColumn(liLuNum[4].toString().padLeft(2, '0')),
                  _buildButtonColumn(liLuNum[5].toString().padLeft(2, '0')),
                ],
              ),
              ElevatedButton(onPressed: btnTaped, child: Text('Randomize'))
            ],
          )),
        ));
  }

  nextInt(int i) {}
}
