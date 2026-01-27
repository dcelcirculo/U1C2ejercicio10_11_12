/*
Nivel 2:

10. (Listas de Mapas) Lista de Tareas (JSON)

a. Crea una List<Map<String, dynamic>> llamada tareasJson.
b. Añade 3 mapas a la lista. Cada mapa representa una tarea y debe tener: id (int), descripcion (String) y completada (bool).
c. Inventa los datos para las 3 tareas (asegúrate de que al menos una esté completada y otra no).
*/

void main() {
  List<Map<String, dynamic>> tareasJSon = [
    {'id': 1, 'descripcion': 'Comprar leche', 'completada': false},
    {'id': 2, 'descripcion': 'Comprar huevos', 'completada': false},
    {'id': 3, 'descripcion': 'Comprar pan', 'completada': true},
  ];

  /*
12. (Listas + Clases + .map) De JSON a Objetos

¡El gran salto! Toma la lista tareasJson del ejercicio 10.

a. Usa el método .map() para convertir esa List<Map<String, dynamic>> en una List<Tarea>. (Pista: Dentro del .map(), deberás llamar a tu constructor Tarea.fromMap(...)).
b. Imprime la descripción de la primera tarea de tu nueva lista de objetos.
*/

  List<Tarea> tareasJsonaList = tareasJSon.map((Map<String, dynamic> mapa) {
    // Usa .map() para convertir cada mapa en un objeto Tarea
    return Tarea.fromMap(mapa);
  }).toList();

  // Imprimir todas las tareas
  for (var tarea in tareasJsonaList) {
    // Itera sobre cada tarea en la lista
    print(
      'ID: ${tarea.id}, Descripción: ${tarea.descripcion}, Completada: ${tarea.completada}', // Imprime los detalles de la tarea
    );
  }

  /*
13. (Listas + Clases + .where) Filtrando Objetos

a. Usando la List<Tarea> (la lista de objetos) del ejercicio 12. Usa .where() para crear una nueva lista llamada tareasPendientes que contenga solo los objetos Tarea cuyo atributo completada sea false.
b. Imprime la cantidad de tareas pendientes.
*/

  List<Tarea> tareasPendientes = tareasJsonaList
      .where((tarea) => tarea.completada == false)
      .toList(); // Filtra las tareas pendientes
  // Imprime la cantidad de tareas pendientes
  print('Cantidad de tareas pendientes: ${tareasPendientes.length}');
}

/*
11. (Clases + .fromMap) Clase Tarea

a. Crea una clase Tarea con los atributos: id (int), descripcion (String), completada (bool).
b. Crea un constructor principal (con parámetros nombrados, como en el ejercicio 9).
c. Crea un constructor nombrado llamado Tarea.fromMap(Map<String, dynamic>map) que reciba un mapa (como los del ejercicio 10) e inicialice los atributos de la clase.
*/

class Tarea {
  int id;
  String descripcion;
  bool completada;

  Tarea({
    // Constructor principal
    required this.id,
    required this.descripcion,
    required this.completada,
  });

  Tarea.fromMap(Map<String, dynamic> map)
    : // Constructor nombrado
      id = map['id'], // Inicializa el atributo id con el valor del mapa
      descripcion =
          map['descripcion'], // Inicializa el atributo descripcion con el valor del mapa
      completada =
          map['completada']; // Inicializa el atributo completada con el valor del mapa
}
