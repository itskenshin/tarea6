import 'package:marcoapp/model/model.dart';

// personajes de la serie marco polo
final List<Personajes> personajes = [
  Personajes(
      id: 'p1',
      nombre: 'Marco polo',
      descripcion:
          'Marco Polo fue un aventurero veneciano que introdujo Asia en Europa. Tras años viajando, a su vuelta, Marco Polo trajo historias que ayudaron a introducir a los europeos en Asia y contribuyeron a desmitificar el continente en gran parte desconocido.',
      imagen:
          'https://cloudfront-eu-central-1.images.arcpublishing.com/prisaradio/E7NHUVHDVRIDBOHXDETM3NTDY4.jpg'),
  Personajes(
      id: 'p2',
      nombre: 'Kublai Khan',
      descripcion:
          'quinto y último gran kan (1260-1294) del Imperio mongol y primer emperador de la dinastía Yuan (1271-1294).',
      imagen:
          'https://i0.wp.com/elrincon.tv/wp-content/uploads/2014/12/Marco-Polo-Khan.jpg?ssl=1'),
  Personajes(
      id: 'p3',
      nombre: 'Cien ojos',
      descripcion: "El mejor guerrero del Kan y mentor de marco polo",
      imagen:
          "https://occ-0-1361-1217.1.nflxso.net/dnm/api/v6/6AYY37jfdO6hpXcMjf9Yu5cnmO0/AAAABTQgh-QcKfGUNNmVbHYjSxWBr2eMv56kVCfBkDpX_eiYb_0H3Xakz3CflFBajzdtvviSGsYQ6fj0mY_oqJ53qTB8TV6448rvSs8y.jpg?r=b5c")
];

// momentos de la serie marco polo

final List<Momentos> momentos = [
  Momentos(
      id: 'm1',
      foto:
          'https://www.indiewire.com/wp-content/uploads/2015/12/marco-polo.jpg?w=640',
      titulo: 'Marco vs 100 ojos',
      video: 'lib/assets/images/videoplayback.mp4'),
  Momentos(
      id: 'm2',
      foto:
          'https://i.pinimg.com/originals/8c/a4/de/8ca4dec86286051260fa2ada59989589.jpg',
      titulo: '100 ojos vs los caballeros',
      video: 'lib/assets/images/cien.mp4'),
  Momentos(
      id: 'm3',
      foto:
          'https://static-blogs.diariovasco.com/wp-content/uploads/sites/37/2015/10/marco-polo2-e1444820675246.jpg',
      titulo: 'La invasion de los mongoles a china',
      video: 'lib/assets/images/mongol.mp4'),
];

// lista de estado edades

final List<Age> edades = [
  Age(id: 'e1', estado: 'Niño', imagen: 'lib/assets/images/niño.jpg'),
  Age(id: 'e2', estado: 'Adolescente', imagen: 'lib/assets/images/adolescente.jpg'),
  Age(id: 'e3', estado: 'Adulto', imagen: 'lib/assets/images/adulto.jpg'),
  Age(id: 'e4', estado: 'Anciano', imagen: 'lib/assets/images/anciano.jpg'),
];
