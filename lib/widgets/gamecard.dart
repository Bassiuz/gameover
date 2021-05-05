import 'package:flutter/material.dart';
import 'package:gameover/model/game-status.dart';
import 'package:gameover/widgets/gamecardtags.dart';
import '../tools/skew-clippers.dart';

class GameCard extends StatelessWidget {
  final String imageUrl;
  final GameStatus gameStatus;

  GameCard({required this.imageUrl, required this.gameStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75,
        width: double.infinity,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Row(
              children: [
                Expanded(
                  child: ClipPath(
                      clipper: RightEdgeSkewClipper(),
                      child: Image(
                          fit: BoxFit.fitWidth,
                          alignment: FractionalOffset.topCenter,
                          image: new NetworkImage(imageUrl))),
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.red),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.green),
                  ),
                  flex: 2,
                ),
                Container(
                  child: GameCardTags(
                    gameStatus: gameStatus,
                  ),
                  width: 200,
                ),
              ],
            ),
          ),
        ));
  }
}
