class Conte {
  String nom;
  String path;
  String video;
  String desc;
  String id;

  Conte.d() {
    this.id = null;
    this.nom = null;
    this.path = null;
    this.video = null;
    this.desc = null;
  }

  Conte(String id, String nom, String path, String video, String desc) {
    this.id = id;
    this.nom = nom;
    this.path = path;
    this.video = video;
    this.desc = desc;
  }

  Conte.c(Conte p) {
    this.id = p.id;
    this.nom = p.nom;
    this.path = p.path;
    this.video = p.video;
    this.desc = p.desc;
  }
}
