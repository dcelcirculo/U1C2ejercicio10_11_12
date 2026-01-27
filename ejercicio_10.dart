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
