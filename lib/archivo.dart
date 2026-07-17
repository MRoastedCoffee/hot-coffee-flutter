import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Archivo {
  static Future<File> _obtenerArchivo() async {
    final directorio = await getApplicationDocumentsDirectory();

    return File('${directorio.path}/registro.txt');
  }

  static Future<void> guardarRegistro(String usuario) async {
    final archivo = await _obtenerArchivo();

    final fecha = DateTime.now();

    await archivo.writeAsString(
      'Usuario: $usuario - Fecha: $fecha\n',
      mode: FileMode.append,
    );
  }

  static Future<String> leerRegistro() async {
    try {
      final archivo = await _obtenerArchivo();

      if (await archivo.exists()) {
        return await archivo.readAsString();
      }

      return "No hay registros.";
    } catch (_) {
      return "No hay registros.";
    }
  }
}