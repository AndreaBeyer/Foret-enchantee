import 'Conte.dart';

class ListeContes {
  List<Conte> _listeContes;
  List<Conte> _listeDefaut;

  ListeContes() {
    _listeContes = new List<Conte>();
    _listeDefaut = new List<Conte>();
  }

  bool getActualContain(Conte c) {
    return _listeContes.contains(c);
  }

  void resetActual() {
    _listeContes = new List<Conte>();
  }

  void addActual(Conte c) {
    _listeContes.add(c);
  }

  void addDefault(Conte c) {
    _listeDefaut.add(c);
  }

  Conte getDefautAt(int i) {
    return _listeDefaut.elementAt(i);
  }

  Conte getActualAt(int i) {
    return _listeContes.elementAt(i);
  }

  bool actualIsEmpty() {
    return _listeContes.isEmpty;
  }

  bool defaultIsEmpty() {
    return _listeDefaut.isEmpty;
  }

  void removeActual(Conte c) {
    _listeContes.remove(c);
  }

  int getLengthActual() {
    return _listeContes.length;
  }

  int getLengthDefault() {
    return _listeDefaut.length;
  }
}
