import 'package:flutter/material.dart';
import 'package:bcrypt/bcrypt.dart';
import 'inicio.dart';
import 'registro.dart';
import 'database.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io';
import 'notis.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  await Notis.inicializar();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String mensaje = "";

  Future<void> iniciarSesion() async {
    String usuario = usuarioController.text.trim();
    String password = passwordController.text;

    if (usuario.isEmpty || password.isEmpty) {
      setState(() {
        mensaje = "Completa todos los campos";
      });
      return;
    }

    final usuarioBD =
        await DatabaseHelper.instancia.buscarUsuario(usuario);

    if (usuarioBD == null) {
      setState(() {
        mensaje = "Usuario o contraseña incorrectos";
      });
      return;
    }

    bool loginCorrecto = BCrypt.checkpw(
      password,
      usuarioBD['password'],
    );

  if (loginCorrecto) {
    usuarioController.clear();
    passwordController.clear();

    setState(() {
      mensaje = "";
    });

    await Notis.mostrar(
      "Inicio de sesión",
      "¡Bienvenido $usuario!",
    );

    if (!mounted) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PaginaInicio(),
      ),
    );
} else {
      setState(() {
        mensaje = "Usuario o contraseña incorrectos";
      });
    }
  }

  @override
  void dispose() {
    usuarioController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Iniciar Sesión",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: usuarioController,
                  onChanged: (_) {
                    if (mensaje.isNotEmpty) {
                      setState(() {
                        mensaje = "";
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Usuario",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  onChanged: (_) {
                    if (mensaje.isNotEmpty) {
                      setState(() {
                        mensaje = "";
                      });
                    }
                  },
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: iniciarSesion,
                  child: const Text("Iniciar sesión"),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistroScreen(),
                      ),
                    );

                    usuarioController.clear();
                    passwordController.clear();

                    setState(() {
                      mensaje = "";
                    });
                  },
                  child: const Text("¿No tienes cuenta? Regístrate"),
                ),

                const SizedBox(height: 20),

                Text(
                  mensaje,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.red,
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