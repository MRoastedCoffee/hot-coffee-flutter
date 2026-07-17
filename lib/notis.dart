import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notis {
  static final FlutterLocalNotificationsPlugin
      flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

static Future<void> inicializar() async {

  const WindowsInitializationSettings windowsSettings =
      WindowsInitializationSettings(
    appName: 'MRCoffee',
    appUserModelId: 'com.roel.coffee',
    guid: '12345678-1234-1234-1234-123456789012',
  );

  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings settings = InitializationSettings(
    windows: windowsSettings,
    android: androidSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(
    settings: settings,
  );

  if (Platform.isAndroid) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }
}

  static Future<void> mostrar(
  String titulo,
  String mensaje,
) async {

  if (Platform.isWindows) {

    const WindowsNotificationDetails windowsDetails =
        WindowsNotificationDetails();

    const NotificationDetails detalles = NotificationDetails(
      windows: windowsDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: titulo,
      body: mensaje,
      notificationDetails: detalles,
    );

  } else if (Platform.isAndroid) {

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
          'coffee_channel',
          'Notificaciones de Hot Coffee',
          channelDescription:
              'Avisos importantes de la aplicación',
          importance: Importance.high,
          priority: Priority.high,
        );

    const NotificationDetails detalles =
        NotificationDetails(
          android: androidDetails,
        );

    await flutterLocalNotificationsPlugin.show(
      id: 0,
      title: titulo,
      body: mensaje,
      notificationDetails: detalles,
    );
  }
}
}