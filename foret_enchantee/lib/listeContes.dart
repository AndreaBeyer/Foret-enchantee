import 'Conte.dart';

class ListeContes {
  List<Conte> _listeContes;
  List<Conte> _listeDefaut;
  List<Conte> _historicDelete;

  ListeContes() {
    _listeContes = new List<Conte>();
    _listeDefaut = new List<Conte>();
    _historicDelete = new List<Conte>();
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

  void addHistoric(Conte c) {
    _historicDelete.add(c);
  }

  Conte getLastHistory() {
    return _historicDelete.last;
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

  bool historicIsEmpty(){
    return _historicDelete.isEmpty;
  }

  void removeActual(Conte c) {
    _listeContes.remove(c);
  }
  void removeLastHistory() {
    _historicDelete.removeLast();
  }

  int getLengthActual() {
    return _listeContes.length;
  }

  int getLengthDefault() {
    return _listeDefaut.length;
  }

  Conte searchActualByID(String id) {
    for (Conte c in _listeContes) {
      if (c.id == id) {
        return c;
      }
    }
    return null;
  }

  Conte searchDefaultByID(String id) {
    for (Conte c in _listeDefaut) {
      if (c.id == id) {
        return c;
      }
    }
    return null;
  }
}
