import 'package:flutter/material.dart';
import '../tools/skew-clippers.dart';
import '../model/game-status.dart';

class GameCardTags extends StatelessWidget {
  final GameStatus gameStatus;

  GameCardTags({required this.gameStatus});

  List<Widget> returnGameBeatWidget() {
    List<Widget> result = List<Widget>.filled(
        1,
        ClipPath(
            clipper: LeftEdgeSkewClipper(),
            child: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            )),
        growable: true);

    if (gameStatus == GameStatus.beat || gameStatus == GameStatus.completed)
    {
      result.add(Container(
        margin: EdgeInsets.only(left: 25),
        child: ClipPath(
            clipper: LeftEdgeSkewClipper(),
            child: Container(
              decoration: const BoxDecoration(color: Colors.red),
            )),
      ));
    }
     
    if (gameStatus == GameStatus.completed)
    {
    result.add(Container(
        margin: EdgeInsets.only(left: 50),
        child: ClipPath(
            clipper: LeftEdgeSkewClipper(),
            child: Container(
              decoration: const BoxDecoration(color: Colors.green),
            )),
      ));
    }

  String label = "";

   switch(gameStatus) { 
      case GameStatus.collected: {  label = "Collected"; } 
      break; 
     
      case GameStatus.beat: {  label = "Beat the game"; } 
      break; 
     
      case GameStatus.completed: {  label = "100% Completed"; } 
      break; 
    
      default: { } 
      break; 
   } 

    result.add(
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
          ],
        ),
      ),
    );

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: returnGameBeatWidget(),
    );
  }
}
