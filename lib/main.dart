import 'package:flutter/material.dart';

import 'Match.dart';
import 'EquipeWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: View_Equipe(title: 'VolleyBall ScoreBoard'),
    );
  }
}

// classe mère du Stateful widget
class View_Equipe extends StatefulWidget {
  View_Equipe({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _View_EquipeState createState() => _View_EquipeState();
}

// la classe avec les états
class _View_EquipeState extends State<View_Equipe> {
  //List<Equipe> equipes = [Equipe(nom:"Locaux"), Equipe(nom:"Visiteurs")];
  Match match = Match();
  final String locaux = "locaux";
  final String visiteurs = "visiteurs";
  bool isInverted = false;

  double tailleWidget(BuildContext context, double d) {
    return MediaQuery.of(context).size.width * d;
  }

  double offsetWidget(BuildContext context, double d) {
    return MediaQuery.of(context).size.width * d;
  }

  void plusUn(String equipe) {
    match.plusUn(equipe);
  }

  void moinsUn(String equipe) {
    this.setState(() {
      match.moinsUn(equipe);
    });
  }

  void tempsMort(String equipe, int lequel) {
    this.setState(() {
      match.prendreTempsMort(equipe, lequel);
    });
  }

  // Build de l'échaffaudage
  @override
  Widget build(BuildContext context) {
    //return Container();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(children: [
          FloatingActionButton(onPressed: () {
            setState(() {
              isInverted = !isInverted;
            });
          }),
          Container(
            width: tailleWidget(context, 1),
            height: 200,
            child: Stack(children: [
              AnimatedPositioned(
                  width: tailleWidget(context, 0.5),
                  //top:0,
                  //height: 200,
                  left: isInverted ? offsetWidget(context, 0.5) : 0,
                  child: EquipeWidget(
                      nom : match.getNom(locaux),
                      score: match.getScore(locaux),
                      tempsMorts : match.getTempsMorts(locaux),
                          plusUn: () {
                            setState(() {
                              match.plusUn(locaux);
                            });
                          },
                          moinsUn: () {
                            setState(() {
                              match.moinsUn(locaux);
                            });
                          },
                          tempsMort1: () {
                            setState(() {
                              match.prendreTempsMort(locaux, 1);
                            });
                          },
                      tempsMort2: () {
                        setState(() {
                          match.prendreTempsMort(locaux, 2);
                        });
                      }),
                  duration: Duration(milliseconds: 500)),
              AnimatedPositioned(
                  width: tailleWidget(context, 0.5),
                  //top:0,
                  //height: 200,
                  left: isInverted ? 0 : offsetWidget(context, 0.5),
                  child: EquipeWidget(
                      nom : match.getNom(visiteurs),
                      score: match.getScore(visiteurs),
                      tempsMorts : match.getTempsMorts(visiteurs),

                      plusUn: () {
                        setState(() {
                          match.plusUn(visiteurs);
                        });
                      },
                      moinsUn: () {
                        setState(() {
                          match.moinsUn(visiteurs);
                        });
                      },
                      tempsMort1: () {
                        setState(() {
                          match.prendreTempsMort(visiteurs,1);
                        });
                      },
                      tempsMort2: () {
                        setState(() {
                          match.prendreTempsMort(visiteurs,2);
                        });
                      }),
                  duration: Duration(milliseconds: 500)),
            ]),
          ),
          Container(
            child: Table(
              children: [
                TableRow(children: [Text("une ligne")]),
                TableRow(children: [Text("une ligne")]),
              ],
            ),
          )
        ]));
  }
}
