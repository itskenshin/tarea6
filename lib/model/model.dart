class Personajes {
  final String id;
  final String nombre;
  final String descripcion;
  final String imagen;

  Personajes(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      required this.imagen});
}

class Momentos {
  final String id;
  final String foto;
  final String titulo;
  final String video;

  Momentos(
      {required this.id,
      required this.foto,
      required this.titulo,
      required this.video});
}

class Age {
  final String id;
  final String estado;
  final String imagen;

  Age({required this.id, required this.estado, required this.imagen});
}


class Univ {
  final String id;
  final String nombre;
  final String dominio;
  final String link;

  Univ(
      {required this.id,
      required this.nombre,
      required this.dominio,
      required this.link});
}