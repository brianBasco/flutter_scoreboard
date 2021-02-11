import 'package:flutter/material.dart';

class EquipeWidget extends StatelessWidget {
  final String nom;
  final int score;
  final List<String> tempsMorts;
  final Function plusUn;
  final Function moinsUn;
  final Function tempsMort1;
  final Function tempsMort2;

  EquipeWidget(
      {this.nom,
      this.tempsMorts,
      this.score,
      this.plusUn,
      this.moinsUn,
      this.tempsMort1,
      this.tempsMort2});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: TextField())),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: Text("$score"))),
      Container(
        child: Row(
          children: [
            FlatButton(
                child: Text(
                  '-1',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: moinsUn),
            FlatButton(
                child: Text(
                  '+1',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: plusUn),
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Visibility(
              visible: tempsMorts[0] !=null ? true : false,
              child: FlatButton(onPressed: tempsMort1, child: Text("temps mort"))
            ),
            Visibility(
                visible: tempsMorts[1] !=null ? true : false,
                child: FlatButton(onPressed: tempsMort2, child: Text("temps mort"))
            )


          ]))
    ]);
  }
}
