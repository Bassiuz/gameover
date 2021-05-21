import 'package:flutter/material.dart';
import 'package:gameover/model/game-status.dart';
import 'package:gameover/widgets/gamecardtags.dart';
import '../tools/skew-clippers.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("Game name", style: GoogleFonts.zillaSlab(fontSize: 28)), Text("Super Nintendo (1998)", style: GoogleFonts.zillaSlab()),],
                    ),
                  ),
                  flex: 4,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.green),
                  ),
                  flex: 2,
                ),
                  GameCardTags(
                    gameStatus: gameStatus,
                    size: MediaQuery.of(context).size.width > 1000? "large" : "small",
                  ),
              ],
            ),
          ),
        ));
  }
}
