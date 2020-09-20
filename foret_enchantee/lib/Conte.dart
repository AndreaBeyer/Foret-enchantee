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

  Conte.n(Conte p) {
    this.nom = p.nom;
    this.path = p.path;
    this.video = p.video;
    this.desc = p.desc;
  }

  void fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.nom = map['nom'];
    this.path = map['path'];
    this.video = map['video'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'nom': this.nom,
      'path': this.path,
      'video': this.video,
    };
    if (id != null) {
      map['id'] = this.id;
    }
    return map;
  }
}
