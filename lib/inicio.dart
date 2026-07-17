import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'api.dart';
import 'archivo.dart';
import 'notis.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  // Slider
  double valorSlider = 0;

  // Switch
  bool textoGrande = false;

  // Radio Buttons
  String opcionSeleccionada = "";

  String horaActual = "";
  Timer? reloj;

  int segundos = 0;
  bool notificacionEnviada = false;

  String resultadoCompute = "";

  void iniciarReloj() {
  horaActual = DateTime.now().toString().substring(11, 19);

  reloj = Timer.periodic(
    const Duration(seconds: 1),
    (timer) {
      setState(() {
        horaActual =
            DateTime.now().toString().substring(11, 19);
            segundos++;
      });
      if (!notificacionEnviada && segundos >= 30) {
          notificacionEnviada = true;

          Notis.mostrar(
            "☕ Es momento de un descanso",
            "Has estado usando Hot Coffee durante un momento. ¿Qué tal una pausa para disfrutar un café?",
          );
        }
    },
  );
}

Future<void> ejecutarCompute() async {
  setState(() {
    resultadoCompute = "Calculando...";
  });

  final resultado = await compute(calcularSuma, 100000000);

  setState(() {
    resultadoCompute = "Resultado: $resultado";
  });
}

  @override
  void initState() {
    super.initState();
    iniciarReloj();
  }

  @override
  void dispose() {
    reloj?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página de Inicio"),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.coffee,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Hot Coffee",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Inicio"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.api),
              title: const Text("REST Client"),
              onTap: () {
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ApiScreen(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Cerrar sesión"),
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [

            const CafeCard(
              nombre: "Mi Café Favorito",
            ),

            const SizedBox(height: 25),

            const Text(
              "Hora actual",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              horaActual,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),

            const SizedBox(height: 20),

                // ===== ICONO GIRATORIO =====

                Transform.rotate(
                  angle: valorSlider * pi / 180,
                  child: const Icon(
                    Icons.coffee,
                    size: 120,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  "Rotación: ${valorSlider.toInt()}°",
                  style: const TextStyle(fontSize: 20),
                ),

                Slider(
                  value: valorSlider,
                  min: 0,
                  max: 360,
                  divisions: 360,
                  onChanged: (valor) {
                    setState(() {
                      valorSlider = valor;
                    });
                  },
                ),

                const Divider(height: 40),

                // ===== SWITCH =====

                Text(
                  "CAFEEEEE SIIIII",
                  style: TextStyle(
                    fontSize: textoGrande ? 35 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Agrandar"),
                    Switch(
                      value: textoGrande,
                      onChanged: (valor) {
                        setState(() {
                          textoGrande = valor;
                        });
                      },
                    ),
                  ],
                ),

                const Divider(height: 40),

                // ===== RADIO BUTTONS =====

                const Text(
                  "Elige un café: ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                RadioListTile<String>(
                  title: const Text("Café"),
                  value: "Café",
                  groupValue: opcionSeleccionada,
                  onChanged: (valor) {
                    setState(() {
                      opcionSeleccionada = valor!;
                    });
                  },
                ),

                RadioListTile<String>(
                  title: const Text("Capuchino"),
                  value: "Capuchino",
                  groupValue: opcionSeleccionada,
                  onChanged: (valor) {
                    setState(() {
                      opcionSeleccionada = valor!;
                    });
                  },
                ),

                RadioListTile<String>(
                  title: const Text("Latte"),
                  value: "Latte",
                  groupValue: opcionSeleccionada,
                  onChanged: (valor) {
                    setState(() {
                      opcionSeleccionada = valor!;
                    });
                  },
                ),

                const SizedBox(height: 20),

                Text(
                  opcionSeleccionada.isEmpty
                      ? "No se ha seleccionado nada"
                      : "Se seleccionó: $opcionSeleccionada",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(213, 246, 164, 0),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ApiScreen(),
                      ),
                    );
                  },
                  child: const Text("REST Client: CRUD"),
                ),
                const SizedBox(height: 30),

    const Text(
      "Historial de registros",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),

    const SizedBox(height: 15),

    FutureBuilder<String>(
      future: Archivo.leerRegistro(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return const Text("Error al leer el archivo.");
        }

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.brown.shade50,
            border: Border.all(color: Colors.brown),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            snapshot.data ?? "No hay registros.",
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    ),
    const SizedBox(height: 25),

ElevatedButton(
  onPressed: ejecutarCompute,
  child: const Text("Calcular con Isolate"),
),

const SizedBox(height: 10),

Text(
  resultadoCompute,
  style: const TextStyle(
    fontSize: 18,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

int calcularSuma(int limite) {
  int suma = 0;

  for (int i = 1; i <= limite; i++) {
    suma += i;
  }

  return suma;
}

class CafeCard extends StatelessWidget {
  final String nombre;

  const CafeCard({
    super.key,
    required this.nombre,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.brown.shade200,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.brown.shade700,
          width: 2,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            offset: Offset(2, 2),
            color: Colors.black26,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.coffee,
            color: Colors.brown,
            size: 40,
          ),
          const SizedBox(width: 10),
          Text(
            nombre,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}