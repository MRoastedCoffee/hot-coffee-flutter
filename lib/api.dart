import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  String respuesta = "";

  Future<void> getPosts() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    final response = await http.get(url);

    setState(() {
      respuesta = response.body;
    });
  }

  Future<void> getPost1() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");

    final response = await http.get(url);

    setState(() {
      respuesta = response.body;
    });
  }

  Future<void> post() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "title": "Mi primer post",
        "body": "Hola desde Flutter",
        "userId": 1,
      }),
    );

    setState(() {
      respuesta = response.body;
    });
  }

  Future<void> put() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");

    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "id": 1,
        "title": "Título actualizado",
        "body": "Contenido actualizado",
        "userId": 1,
      }),
    );

    setState(() {
      respuesta = response.body;
    });
  }

  Future<void> patch() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");

    final response = await http.patch(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "title": "Solo cambié el título",
      }),
    );

    setState(() {
      respuesta = response.body;
    });
  }

  Future<void> delete() async {
    final url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");

    final response = await http.delete(url);

    setState(() {
      respuesta =
          "Código de respuesta: ${response.statusCode}\n\n${response.body}";
    });
  }

  Future<void> todos() async {
    await getPosts();
    await Future.delayed(const Duration(seconds: 2));

    await getPost1();
    await Future.delayed(const Duration(seconds: 2));

    await post();
    await Future.delayed(const Duration(seconds: 2));

    await put();
    await Future.delayed(const Duration(seconds: 2));

    await patch();
    await Future.delayed(const Duration(seconds: 2));

    await delete();
  }

  Widget boton(String texto, VoidCallback accion) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: accion,
          child: Text(texto),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST Client: CRUD"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            boton("GET /posts", getPosts),
            boton("GET /posts/1", getPost1),
            boton("POST", post),
            boton("PUT", put),
            boton("PATCH", patch),
            boton("DELETE", delete),
            boton("TODOS", todos),

            const SizedBox(height: 15),

            const Divider(),

            Expanded(
              child: SingleChildScrollView(
                child: SelectableText(
                  respuesta,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}