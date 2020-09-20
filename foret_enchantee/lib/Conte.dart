class Conte {
  String nom;
  String path;
  String video;
  String desc;
  int id;

  Conte.d() {
    this.nom = null;
    this.path = null;
    this.video = null;
    this.desc = null;
  }

  Conte(String nom, String path, String video, String desc) {
    this.nom = nom;
    this.path = path;
    this.video = video;
    this.desc = desc;
  }

  Conte.c(Conte p) {
    this.nom = p.nom;
    this.path = p.path;
    this.video = p.video;
    this.desc = p.desc;
  }
}
