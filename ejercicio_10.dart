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

    // Imprime la descripción de la primera tarea
    print(tareasJsonaList[0].descripcion);
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

  // 14.d.
  Configuracion config = Configuracion(
    urlApi: 'https://api.ejemplo.com',
    modo: 'dark',
    timeout: 5000,
  );
  //config.modo = 'light'; // Esto debería dar un error porque los atributos son finales

  // 15.b. En main(), crea una configInicial. Luego, crea una configModoOscuro usando configInicial.copyWith(modo: 'dark'). Imprime ambas para ver que son diferentes.

  // Creación de la configuración inicial
  final configInicial = Configuracion(
    urlApi: 'http://api.ejemplo.com',
    modo: 'light',
    timeout: 5000,
  );
  // Creación de una nueva configuración modificando solo el modo a oscuro
  final Configuracion configOscuro = configInicial.copyWith(modo: 'dark');
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

/*
14. (Inmutabilidad) Clase Configuracion Inmutable

a. Crea una clase inmutable Configuracion.
b. Debe tener 3 atributos: final String urlApi, final String modo (ej: 'dark', 'light'), final int timeout.
c. Crea un constructor const que inicialice estos valores (usa parámetros nombrados y required).
d. En main(), intenta crear una Configuracion y luego intenta modificar uno de sus atributos (debería darte un error).*/

// 14.a.
class Configuracion {
  // 14.b.
  final String urlApi;
  final String modo;
  final int timeout;

  // 14.c.
  const Configuracion({
    // Constructor const
    required this.urlApi,
    required this.modo,
    required this.timeout,
  });

  /* 15.a. (Inmutabilidad + copyWith) El Método copyWith

A la clase inmutable Configuracion (ejercicio 14), añade el método copyWith.
*/
  Configuracion copyWith({
    // Parámetros opcionales para copiar y modificar atributos
    // Los parametros que van dentro de {}, son llamados parametros nombrados, Se llaman por nombre al invocarlos
    // El ? indica que el parametro es opcional y puede ser null porque la idea es que si no se pasa un valor, se use el valor original
    String? urlApi,
    String? modo,
    int? timeout,
  }) {
    // Retorna una nueva instancia de Configuracion con los valores modificados o los originales
    return Configuracion(
      // Estamos retornando una nueva instancia de Configuracion. Osea que no cambia el objeto actual, sino que crea uno nuevo con los cambios
      urlApi: // Campo del constructor
          urlApi ?? // Es el parametro pasado al metodo copyWith.
          // El operador ?? significa "si el valor de la izquierda es null, usa el valor de la derecha"
          this.urlApi, // Es el valor original que se tenía antes de llamar a copyWith
      modo: modo ?? this.modo,
      timeout: timeout ?? this.timeout,
    );
  }
}

/* 16. (POO y Listas) Carrito de Compras

Crea una clase Producto inmutable (final String nombre, final double precio).
*/

class Producto {
  // Clase Producto
  // Atributos
  final String nombre;
  final double precio;

  // Constructor const
  const Producto({required this.nombre, required this.precio});
}

//16.b. Crea una clase CarritoDeCompras. CarritoDeCompras debe tener un atributo: List<Producto> _productos = [].

class CarritoDeCompras {
  List<Producto> _productos =
      []; // Atributo privado para almacenar los productos

  // 16.c. Añade un método agregarProducto(Producto producto).
  void agregarProducto(Producto producto) {
    // Método para agregar un producto al carrito
    _productos.add(producto); // Agrega el producto a la lista
  }

  /* 16.d. Añade un método double calcularTotal() que itere sobre la lista _productos (puedes usar .forEach o un for...in) y devuelva la suma de todos los precios.

  double calcularTotal() {
    double total = 0.0; // Variable para almacenar el total
    for (var producto in _productos) {
      total += producto.precio; // Suma el precio de cada producto al total
    }
    return total; // Retorna el total calculado
  }*/

  //16.e. Añade un getter List<Producto> get productos => _productos; para poder ver los productos desde fuera, pero no modificarlos directamente.

  List<Producto> get productos => _productos;

  // 17. (POO Avanzado) Mejorando el Carrito de Compras

  // (Investiga esto) Modifica calcularTotal() (ejercicio 16) para que use el método .fold() en la lista.
  double calcularTotal() {
    return _productos.fold(0.0, (suma, p) => suma + p.precio);
  }
}
