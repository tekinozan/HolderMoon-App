import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'HolderMoon';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  Container MyArticles(
      String imageVal, String a, String b, String c, double x, double y) {
    final double _borderRadius = 24;
    return Container(
      width: 285,
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        gradient: LinearGradient(
            colors: [Colors.indigo, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
            color: Colors.amber,
            blurRadius: 12,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                imageVal,
                height: x,
                width: y,
              ),
              Text(
                a,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      child: Text(b),
                      onPressed: () async {
                        final url = c;

                        if (await canLaunch(url)) {
                          await launch(
                            url,
                            forceSafariVC: false, //ios
                          );
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(2),
                          fixedSize: Size(150, 24),
                          textStyle: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          primary: Colors.amber,
                          onPrimary: Colors.black87,
                          elevation: 20,
                          shadowColor: Colors.orange,
                          shape: StadiumBorder())),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: const Text('Floating Action Button'),
      //),

      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.purple,
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spacing: 12,
        spaceBetweenChildren: 12,
        children: [
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.twitter),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onTap: () async {
              const url = 'https://mobile.twitter.com/holdermoon_';

              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: false, //ios
                );
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.web_asset),
            label: "Go to our website",
            onTap: () async {
              const url = 'https://holdermoon.com/';

              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: false, //ios
                );
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          SpeedDialChild(
            child: Icon(FontAwesomeIcons.instagram),
            foregroundColor: Colors.red,
            onTap: () async {
              const url = 'https://www.instagram.com/holdermoon_/';

              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: false, //ios
                );
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),

      body: Container(
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/moon.jpg"),
                        fit: BoxFit.cover)),
                child: Align(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TO THE',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 62,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 12,
                                color: Colors.orange,
                                offset: Offset(0, 5),
                              ),
                            ],
                          )),
                        ),
                        Text(
                          'MOON!',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                            fontSize: 62,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.orange,
                            shadows: [
                              Shadow(
                                blurRadius: 7,
                                color: Colors.white,
                                offset: Offset(0, 5),
                              ),
                            ],
                          )),
                        ),
                      ]),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment(0, 0.78),
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      MyArticles(
                        "assets/dnm.png",
                        "HLM",
                        "Buy HolderMoon",
                        'https://pancakeswap.finance/swap?outputCurrency=0x71E4e5168CE91eF956DD5Bb80dB391e400aA325F',
                        64,
                        64,
                      ),
                      MyArticles(
                          "assets/graph.png",
                          " HLM Graph",
                          "Open Graph",
                          'https://dex.guru/token/0x71e4e5168ce91ef956dd5bb80db391e400aa325f-bsc',
                          80,
                          200),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
