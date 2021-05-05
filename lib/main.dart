import 'package:flutter/material.dart';
import 'package:gameover/model/game-status.dart';

import 'widgets/gamecard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Over by Bas de Vaan',
      theme: ThemeData(primaryColor: Colors.black, brightness: Brightness.dark),
      home: MyHomePage(title: 'Game Over!'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text('test'),
            GameCard(imageUrl: "https://picsum.photos/300/300", gameStatus: GameStatus.completed),
            GameCard(imageUrl: "https://picsum.photos/300/301", gameStatus: GameStatus.beat),
            GameCard(imageUrl: "https://picsum.photos/301/300", gameStatus: GameStatus.collected)
          ],
        ),
      ),
    );
  }
}