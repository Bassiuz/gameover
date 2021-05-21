import 'package:flutter/material.dart';
import '../tools/skew-clippers.dart';
import '../model/game-status.dart';

class GameCardTags extends StatelessWidget {
  final GameStatus gameStatus;
  final String size;

  GameCardTags({required this.gameStatus, required this.size});

  List<Widget> returnGameBeatWidget() {
    double completedInset = size == "large" ? 50 : 40;
    double beatInset = size == "large" ? 25 : 15;

    List<Widget> result = List<Widget>.filled(
        1,
        ClipPath(
            clipper: LeftEdgeSkewClipper(),
            child: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            )),
        growable: true);

    if (gameStatus == GameStatus.beat || gameStatus == GameStatus.completed) {
      result.add(Container(
        margin: EdgeInsets.only(left: beatInset),
        child: ClipPath(
            clipper: LeftEdgeSkewClipper(),
            child: Container(
              decoration: const BoxDecoration(color: Colors.red),
            )),
      ));
    }

    if (gameStatus == GameStatus.completed) {
      result.add(Container(
        margin: EdgeInsets.only(left: completedInset),
        child: ClipPath(
            clipper: LeftEdgeSkewClipper(),
            child: Container(
              decoration: const BoxDecoration(color: Colors.green),
            )),
      ));
    }

    if (size == "large") {
      String label = "";

      switch (gameStatus) {
        case GameStatus.collected:
          {
            label = "Collected";
          }
          break;

        case GameStatus.beat:
          {
            label = "Beat the game";
          }
          break;

        case GameStatus.completed:
          {
            label = "100% Completed";
          }
          break;

        default:
          {}
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
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == "large" ? 200 : 50,
      child: Stack(
        children: returnGameBeatWidget(),
      ),
    );
  }
}
