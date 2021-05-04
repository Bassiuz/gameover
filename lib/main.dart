import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Over by Bas de Vaan',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a F   lutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: Colors.black,
          brightness: Brightness.dark),
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
            GameCard()
          ],
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  const GameCard({
    Key? key,
  }) : super(key: key);

  final String imageUrl = "https://picsum.photos/300/300";

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
                                          image: new NetworkImage(imageUrl))
                                      ),
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
                                    Expanded(
                                      child: Stack(
                                            children: <Widget>[
                                              ClipPath(
                                                clipper: LeftEdgeSkewClipper(),
                                                child: Container(
                                                decoration: const BoxDecoration(color: Colors.blue),
                                              )),
                                              Container(
                                                margin: EdgeInsets.only(left: 30),
                                                child: ClipPath(
                                                  clipper: LeftEdgeSkewClipper(),
                                                  child: Container(
                                                  decoration: const BoxDecoration(color: Colors.red),
                                                )),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(left: 60),
                                                child: ClipPath(
                                                  clipper: LeftEdgeSkewClipper(),
                                                  child: Container(
                                                  decoration: const BoxDecoration(color: Colors.green),
                                                )),
                                              ),
                                             Text("Collected"),
                                            ],
                                          ),
                                      flex: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ));
                      }
                    }
                    
class RightEdgeSkewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
      final path = Path();
      path.moveTo(0.0, 0.0);
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width * 0.8, size.height);
      path.lineTo(0.0, size.height);
      path.close();
      return path;
  }
  @override
  bool shouldReclip(RightEdgeSkewClipper oldClipper) => false;
}

class LeftEdgeSkewClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
      final path = Path();
      path.moveTo(size.width * 0.2, 0.0);
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
      return path;
  }
  @override
  bool shouldReclip(RightEdgeSkewClipper oldClipper) => false;
}

