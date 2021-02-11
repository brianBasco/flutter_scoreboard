import 'dart:collection';

import 'Equipe.dart';

class Match {

  HashMap<String, Equipe> equipes;
  HashMap<int,bool> isTpsMortTechniquePris;
  int set;
  String locaux = "locaux";
  String visiteurs = "visiteurs";

  Match() {

    this.equipes = new HashMap();
    this.equipes[locaux] = Equipe(nom: locaux);
    this.equipes[visiteurs] = Equipe(nom: visiteurs);
    this.set = 1;

    this.isTpsMortTechniquePris = new HashMap();
    this.isTpsMortTechniquePris[8]=false;
    this.isTpsMortTechniquePris[16] =false;

  }

  // getter du score pour chaque équipe
  int getScore(String equipe) {
    return equipes[equipe].scores[this.set];
  }

  String getNom(String equipe) {
    return equipes[equipe].getNom();
  }

  List<String> getTempsMorts(equipe) {
    return equipes[equipe].getTempsMorts();
  }


  void nouveauSet() {
    this.set ++;
    this.equipes[locaux].nouveauSet();
    this.equipes[visiteurs].nouveauSet();

    if (this.set == 5) {
      this.isTpsMortTechniquePris[8] = true;
      this.isTpsMortTechniquePris[16] = true;
    }

    else {
      this.isTpsMortTechniquePris[8] = false;
      this.isTpsMortTechniquePris[16] = false;
    }

    }

  bool isASetWinner() {

    int victory = (this.set <= 4) ?  25 : 15;
    bool isAWinner = false;

      if ((
          (this.equipes[locaux].scores[this.set] >= victory ||
              this.equipes[visiteurs].scores[this.set] >= victory ))
          &&
          ((this.equipes[locaux].scores[this.set] -
              this.equipes[visiteurs].scores[this.set]).abs() >= 2)
      )

        isAWinner = true;

      return isAWinner;

        //if(this.set <=4 ) this.nouveauSet();
        //else this.finMatch();

    }



    // isTempsMortTechnique (nbre)
    // méthode privée
   bool isTempsMortTechnique (nbre) {

      if( (this.equipes[locaux].scores[set] == nbre || this.equipes[visiteurs].scores[set] == nbre) && (!this.isTpsMortTechniquePris[nbre]) ) {
        this.isTpsMortTechniquePris[nbre] = true;
        return true;
      }
    return false;

   }

   void observerActionScore() {

      this.isTempsMortTechnique(8);
      this.isTempsMortTechnique(16);
      this.isASetWinner();
   }

    // déléguer les temps mort pour chaque équipe
    void prendreTempsMort(String equipe, int lequel) {

    this.equipes[equipe].prendreTempsMort(lequel);

    }

    void plusUn(String equipe) {
      this.equipes[equipe].plusUn(this.set);

    }

    void moinsUn(String equipe) {
    this.equipes[equipe].moinsUn(this.set);
    }


  void finMatch() {

    // ne fait rien pour le moment
  }

  void recap() {

    // récupération des scores
    HashMap<int, int> scoreLocaux = equipes[locaux].scores;
    HashMap<int, int> scoreVisiteurs = equipes[visiteurs].scores;
    int totalLocaux = 0;
    int totalVisiteurs = 0;

    scoreLocaux.forEach((key, value) { totalLocaux += value; });
    scoreVisiteurs.forEach((key, value) { totalVisiteurs += value; });



  }

}