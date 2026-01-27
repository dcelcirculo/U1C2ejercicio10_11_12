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
