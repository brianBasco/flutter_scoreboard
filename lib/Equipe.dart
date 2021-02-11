import 'dart:collection';

class Equipe {

  // modifier score en hashmap de <int, int>
  String nom;
  //List<int> score;
  HashMap<int, int> scores;
  List<String> tempsMorts;


  Equipe({this.nom}) {
    //this.score = [0,0,0,0,0];
    this.tempsMorts = ["tempsMort", "tempsMort"];
    this.scores = new HashMap();
    for (int i = 1; i<=5 ; i++) {
      this.scores[i] = 0;
    }
  }

  String getNom() {
    return this.nom;
  }

  List<String> getTempsMorts() {
    return this.tempsMorts;
  }

  void plusUn(int set) {
    this.scores[set] ++;
  }

  void moinsUn(int set) {
    if(this.scores[set] > 0) this.scores[set] --;
  }

  void prendreTempsMort(int nbre) {
    this.tempsMorts[nbre-1] = null;
  }

  void nouveauSet() {
    this.tempsMorts = ["tempsMort", "tempsMort"];
  }


}