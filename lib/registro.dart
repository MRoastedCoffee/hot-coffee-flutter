import 'package:flutter/material.dart';
import 'package:bcrypt/bcrypt.dart';
import 'database.dart';
import 'notis.dart';
import 'archivo.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String mensaje = "";

  Future<void> registrarUsuario() async {
    String usuario = usuarioController.text.trim();
    String password = passwordController.text;

    if (usuario.isEmpty || password.isEmpty) {
      setState(() {
        mensaje = "Completa todos los campos";
      });
      return;
    }

    try {
      final usuarioExistente =
          await DatabaseHelper.instancia.buscarUsuario(usuario);

      if (usuarioExistente != null) {
        setState(() {
          mensaje = "Ese usuario ya existe";
        });
        return;
      }

      String passwordHash = BCrypt.hashpw(
        password,
        BCrypt.gensalt(),
      );
      await DatabaseHelper.instancia.registrarUsuario(
        usuario,
        passwordHash,
      );

      await Archivo.guardarRegistro(usuario);

      await Notis.mostrar(
        "Hot Coffee",
        "Usuario registrado correctamente.\nYa puedes iniciar sesión.",
      );

      if (!mounted) return;

      Navigator.pop(context);
    } catch (e) {
      print("ERROR SQLITE: $e");

      setState(() {
        mensaje = "Ocurrió un error al registrar";
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
        title: const Text("Registro"),
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
                  "Crear Cuenta",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(
                    labelText: "Usuario",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Contraseña",
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: registrarUsuario,
                  child: const Text("Registrarse"),
                ),

                const SizedBox(height: 20),

                Text(
                  mensaje,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
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