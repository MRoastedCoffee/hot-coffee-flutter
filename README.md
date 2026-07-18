# ☕ Hot Coffee

> Aplicación desarrollada en **Flutter** como proyecto final para la materia de **Programación Móvil**, cuyo objetivo es demostrar el uso de diversos componentes y herramientas del framework, incluyendo almacenamiento local, consumo de servicios REST, operaciones asíncronas, notificaciones del sistema y desarrollo multiplataforma.

---

# Información del proyecto

| Dato                   | Información                                 |
| ---------------------- | ------------------------------------------- |
| **Proyecto**           | Hot Coffee                                  |
| **Materia**            | Programación Móvil                          |
| **Programa educativo** | Ingeniería en Tecnologías de la Información |
| **Grupo**              | ITI-23                                      |
| **Alumno**             | *Martín Roel*                 |
| **Matrícula**          | *202300077*                       |
| **Profesor**           | *Ing. Jonathan*             |
| **Universidad**        | *Universidad Politécnica de la Región Ribereña*                     |
| **Periodo**            | *Noveno Cuatri*         |

---

# Objetivo

Hot Coffee fue desarrollado como proyecto académico con el propósito de integrar en una sola aplicación los principales temas vistos durante la materia de Programación Móvil utilizando Flutter.

El proyecto busca demostrar la implementación práctica de controles gráficos, navegación entre pantallas, almacenamiento local mediante SQLite, consumo de servicios REST, operaciones asíncronas, manejo de archivos del sistema, notificaciones del dispositivo y otras funcionalidades propias del desarrollo móvil moderno.

Además de cumplir con los requisitos académicos, la aplicación fue diseñada procurando mantener una estructura clara, organizada y fácilmente escalable.

---

# Contenido

* Información del proyecto
* Objetivo
* Descripción general
* Características
* Tecnologías y herramientas utilizadas
* Arquitectura del proyecto
* Diagramas
* Estructura del proyecto
* Instalación y requisitos
* Ejecución en Windows
* Ejecución en Android
* Plataformas probadas
* Capturas de pantalla
* Mejoras futuras
* Créditos
* Licencia

---

# Descripción general

**Hot Coffee** es una aplicación multiplataforma desarrollada con **Flutter 3.44** como proyecto final para la materia de **Programación Móvil**.

La aplicación simula un pequeño sistema relacionado con una cafetería y fue diseñada con el objetivo principal de integrar, en un solo proyecto, la mayoría de las herramientas, widgets y conceptos estudiados durante el curso.

A lo largo del desarrollo se implementaron mecanismos de autenticación con almacenamiento local, consumo de servicios web mediante una API REST, persistencia de información utilizando SQLite, manejo de archivos del sistema, notificaciones del dispositivo, operaciones asíncronas y diferentes controles gráficos proporcionados por Flutter.

El proyecto fue desarrollado procurando mantener una estructura modular y organizada para facilitar futuras ampliaciones y el mantenimiento del código.

---

# Características principales

## Sistema de autenticación

* Inicio de sesión mediante usuario y contraseña.
* Registro de nuevos usuarios.
* Validación de campos vacíos.
* Prevención de usuarios duplicados.
* Contraseñas almacenadas mediante **BCrypt**.
* Persistencia de usuarios utilizando **SQLite**.

---

## Base de datos local

La aplicación utiliza una base de datos SQLite para almacenar la información de los usuarios registrados.

La tabla principal contiene:

* ID
* Usuario
* Contraseña cifrada (BCrypt)

---

## Manejo de archivos locales

Cada vez que un usuario se registra, la aplicación genera automáticamente un registro dentro del archivo:

`registro.txt`

Cada registro almacena:

* Nombre del usuario.
* Fecha.
* Hora del registro.

Posteriormente, esta información es recuperada utilizando **FutureBuilder**, permitiendo mostrar el historial de registros directamente dentro de la aplicación.

---

## Cliente REST

La aplicación consume la API pública **JSONPlaceholder** para demostrar las operaciones principales de un CRUD mediante peticiones HTTP.

Operaciones implementadas:

* GET (Todos los registros)
* GET (Registro individual)
* POST
* PUT
* PATCH
* DELETE

Además, se implementó una opción denominada **TODOS**, la cual ejecuta automáticamente todas las operaciones con pausas programadas para facilitar su demostración durante la presentación del proyecto.

---

## ⏱ Programación asíncrona

El proyecto incorpora distintos mecanismos de programación asíncrona proporcionados por Flutter y Dart:

* FutureBuilder
* async / await
* compute() utilizando Isolates
* Timer.periodic()

Estas herramientas permiten mantener la interfaz fluida mientras se ejecutan tareas que requieren procesamiento adicional.

---

## Notificaciones del sistema

La aplicación implementa notificaciones nativas del sistema operativo.

Como ejemplo de una notificación con utilidad real, después de permanecer un tiempo utilizando la aplicación, el usuario recibe un recordatorio indicando que es un buen momento para tomar un café.

Esta funcionalidad busca representar un caso de uso práctico y coherente con la temática de la aplicación.

---

## Interfaz gráfica

Entre los componentes gráficos implementados se encuentran:

* Login.
* Registro de usuarios.
* Drawer (Menú lateral).
* Slider.
* Switch.
* Radio Buttons.
* Widget personalizado (CafeCard).
* FutureBuilder.
* Pantalla de consumo de API REST.
* Temporizador en tiempo real.
* Navegación entre múltiples pantallas.

---

# Tecnologías y herramientas utilizadas

Para el desarrollo de **Hot Coffee** se utilizaron diferentes tecnologías, herramientas y recursos que permitieron construir una aplicación multiplataforma, organizada y funcional.

---

## Lenguajes y frameworks

### Dart

Lenguaje de programación principal utilizado para desarrollar la lógica de la aplicación.

Se utilizó para implementar:

* Manejo de estados.
* Programación asíncrona.
* Navegación entre pantallas.
* Consumo de servicios REST.
* Manipulación de archivos y bases de datos.

---

### Flutter

Framework principal utilizado para la construcción de la aplicación móvil.

Flutter permitió desarrollar una interfaz multiplataforma utilizando un único código base, facilitando la ejecución del proyecto tanto en Windows como en Android.

Versión utilizada:

* **Flutter 3.44**

---

### Material Design

Sistema de diseño utilizado como base para la construcción de la interfaz gráfica.

Se utilizaron componentes proporcionados por Flutter como:

* Scaffold.
* AppBar.
* Drawer.
* Cards.
* Buttons.
* TextFields.
* Switches.
* Dialogs.
* Sliders.

---

# Almacenamiento y manejo de información

## SQLite

Sistema de almacenamiento local utilizado para guardar la información de los usuarios registrados dentro de la aplicación.

La base de datos permite mantener la información incluso después de cerrar la aplicación.

---

## Sqflite

Paquete utilizado para integrar SQLite dentro de Flutter y realizar operaciones como:

* Creación de tablas.
* Inserción de registros.
* Consultas.
* Validación de usuarios.

---

## BCrypt

Algoritmo utilizado para proteger las contraseñas almacenadas.

En lugar de guardar contraseñas en texto plano, la aplicación almacena una versión cifrada de estas para mejorar la seguridad de la información.

---

# Comunicación con servicios externos

## HTTP

Librería utilizada para realizar peticiones HTTP hacia servicios REST externos.

Fue implementada para demostrar operaciones CRUD mediante solicitudes:

* GET.
* POST.
* PUT.
* PATCH.
* DELETE.

---

## JSONPlaceholder

API pública utilizada como servicio de prueba para la implementación del cliente REST.

Permitió realizar pruebas de comunicación entre la aplicación y un servicio externo sin necesidad de crear un servidor propio.

---

# Herramientas de desarrollo

## Visual Studio Code

Editor principal utilizado para la escritura, organización y depuración del código fuente.

Extensiones utilizadas:

* Dart.
* Flutter.
* Flutter Widget Snippets.
* Error Lens.
* Material Icon Theme.

---

## Android Studio

Herramienta utilizada para:

* Administración de dispositivos virtuales Android.
* Instalación de SDKs necesarios.
* Pruebas de ejecución en Android.

---

## Git y GitHub

Utilizados para el control de versiones y almacenamiento remoto del proyecto.

Git permitió llevar un historial de cambios mediante commits organizados, mientras que GitHub fue utilizado como plataforma de alojamiento del repositorio.

---

# Herramientas de diseño

El diseño de la aplicación fue realizado utilizando los componentes visuales proporcionados por Flutter y Material Design.

Se buscó mantener una interfaz:

* Simple.
* Intuitiva.
* Consistente.
* Adaptable a diferentes tamaños de pantalla.

La identidad visual del proyecto se desarrolló tomando como referencia la temática de una cafetería moderna, utilizando elementos relacionados con café y una navegación sencilla para mejorar la experiencia del usuario.

---

# Herramientas de investigación y documentación

Durante el desarrollo se consultaron diferentes fuentes de información técnica:

* Documentación oficial de Flutter.
* Documentación oficial de Dart.
* Documentación de paquetes utilizados.
* Ejemplos y referencias de comunidades de desarrollo.

Estas fuentes fueron utilizadas para comprender el funcionamiento de las tecnologías implementadas y resolver problemas encontrados durante el desarrollo.

---

# Herramientas de Inteligencia Artificial

Como apoyo durante el desarrollo se utilizó:

## ChatGPT

Utilizado como herramienta de apoyo para:

* Investigación de conceptos.
* Análisis y solución de errores.
* Revisión de estructura del proyecto.
* Mejora de documentación.
* Apoyo en la elaboración del README.

La inteligencia artificial fue utilizada como recurso complementario, manteniendo la comprensión y validación de las implementaciones realizadas dentro del proyecto.

---

# Instalación y requisitos

Para ejecutar correctamente **Hot Coffee** es necesario contar con las herramientas necesarias para compilar proyectos desarrollados con Flutter.

La aplicación fue probada exitosamente en:

* **Windows 11 (aplicación de escritorio).**
* **Dispositivo Android físico mediante conexión USB.**

---

# Requisitos previos

Antes de ejecutar el proyecto es necesario instalar los siguientes componentes:

## Flutter SDK

Flutter es el framework utilizado para desarrollar y ejecutar la aplicación.

Descarga oficial:

https://docs.flutter.dev/get-started/install

Después de instalar Flutter, se recomienda verificar que la instalación sea correcta ejecutando:

```bash
flutter doctor
```

Este comando permite identificar si existe algún componente faltante para la ejecución.

---

## Dart SDK

Dart es el lenguaje utilizado por Flutter para desarrollar la aplicación.

El SDK de Dart viene incluido dentro de Flutter, por lo que no es necesario instalarlo por separado si Flutter fue configurado correctamente.

---

## Git

Git es necesario para descargar el repositorio y administrar el código fuente.

Descarga oficial:

https://git-scm.com/downloads

---

# Requisitos para ejecutar en Windows

Para compilar la aplicación como escritorio de Windows es necesario instalar:

## Visual Studio

Se requiere Visual Studio con las herramientas de desarrollo para C++.

Componentes necesarios:

* Desktop development with C++.
* MSVC C++ Build Tools.
* Windows SDK.

Descarga oficial:

https://visualstudio.microsoft.com/

Después de instalar los componentes necesarios, Flutter debe reconocer la configuración mediante:

```bash
flutter doctor
```

---

# Requisitos para ejecutar en Android

Para ejecutar la aplicación en un dispositivo Android se requiere:

* Android Studio.
* Android SDK.
* Controladores USB del dispositivo.
* Cable USB para conexión física.

Descarga oficial:

https://developer.android.com/studio

También es necesario activar en el dispositivo:

* Opciones de desarrollador.
* Depuración USB.

Para comprobar que Flutter reconoce el dispositivo conectado:

```bash
flutter devices
```

---

# Clonar el proyecto

Después de instalar los requisitos, se debe descargar el repositorio:

```bash
git clone <URL_DEL_REPOSITORIO>
```

Ingresar a la carpeta del proyecto:

```bash
cd hot_coffee
```

---

# Instalar dependencias

Dentro de la carpeta del proyecto ejecutar:

```bash
flutter pub get
```

Este comando descarga todos los paquetes necesarios definidos dentro del archivo:

```
pubspec.yaml
```

---

# Ejecución del proyecto

## Ejecutar en Windows

Verificar que Windows aparezca como dispositivo disponible:

```bash
flutter devices
```

Posteriormente ejecutar:

```bash
flutter run -d windows
```

La aplicación se abrirá como una aplicación de escritorio de Windows.

---

## Ejecutar en Android físico

Conectar el dispositivo Android mediante cable USB y verificar que sea reconocido:

```bash
flutter devices
```

Después ejecutar:

```bash
flutter run -d <id_del_dispositivo>
```

Flutter compilará la aplicación y la instalará automáticamente en el dispositivo conectado.

---

# Plataformas probadas

Durante el desarrollo se realizaron pruebas en las siguientes plataformas:

| Plataforma | Estado |
| --- | --- |
| Windows 11 Desktop | ✅ Funcionando |
| Android físico mediante USB | ✅ Funcionando |

La aplicación fue probada verificando las principales funcionalidades:

* Registro e inicio de sesión.
* Persistencia de usuarios.
* Consumo de API REST.
* Generación de archivos locales.
* Notificaciones.
* Navegación entre pantallas.
* Ejecución de componentes gráficos.

---

# Arquitectura del proyecto

La arquitectura de **Hot Coffee** fue organizada buscando mantener una separación clara entre la interfaz gráfica, la lógica de negocio y el almacenamiento de información.

Aunque Flutter permite desarrollar aplicaciones pequeñas con una estructura sencilla, el proyecto fue dividido en diferentes componentes para facilitar su mantenimiento, comprensión y futuras ampliaciones.

La aplicación sigue una organización basada en capas:

```
Hot Coffee
│
├── Presentación (UI)
│   ├── Pantallas
│   ├── Widgets personalizados
│   └── Componentes visuales
│
├── Lógica de aplicación
│   ├── Validaciones
│   ├── Procesos asíncronos
│   └── Control de navegación
│
├── Servicios
│   ├── Cliente REST
│   ├── Notificaciones
│   └── Manejo de archivos
│
└── Persistencia de datos
    ├── SQLite
    └── Registros locales
```

---

## Capa de presentación

Esta capa contiene todos los elementos relacionados con la interfaz gráfica y la interacción con el usuario.

Incluye:

* Pantalla de inicio de sesión.
* Registro de usuarios.
* Menú lateral (Drawer).
* Pantallas de demostración de funcionalidades.
* Widgets personalizados.
* Componentes Material Design.

Su objetivo es mostrar la información y recibir acciones del usuario sin encargarse directamente del almacenamiento o comunicación externa.

---

## Capa lógica

Contiene las reglas y procesos principales de la aplicación.

Entre sus responsabilidades se encuentran:

* Validación de información ingresada.
* Procesamiento de datos.
* Ejecución de tareas asíncronas.
* Control de eventos.
* Manejo de navegación entre pantallas.

Esta separación permite que la interfaz pueda modificarse sin afectar directamente la lógica interna.

---

## Capa de servicios

Esta capa se encarga de la comunicación con recursos externos y funciones adicionales del sistema.

Incluye:

### Servicio REST

Gestiona la comunicación con la API externa mediante solicitudes HTTP.

Permite ejecutar:

* Consultas.
* Creación de datos.
* Actualización de registros.
* Eliminación de información.

---

### Servicio de archivos

Responsable de generar y consultar archivos locales utilizados por la aplicación.

Ejemplo:

```
registro.txt
```

Este archivo almacena información relacionada con los registros realizados dentro del sistema.

---

### Servicio de notificaciones

Administra la creación de notificaciones del sistema operativo para generar recordatorios al usuario.

---

## Capa de persistencia

La persistencia de información se realiza mediante SQLite.

Esta capa permite:

* Crear usuarios.
* Consultar información registrada.
* Validar credenciales.
* Mantener datos después de cerrar la aplicación.

La comunicación entre Flutter y SQLite se realiza mediante el paquete `sqflite`.

---

# Flujo general de funcionamiento

El flujo principal de la aplicación se puede resumir de la siguiente manera:

```
Usuario
  │
  ▼
Interfaz Flutter
  │
  ├──────────────► SQLite
  │                 │
  │                 ▼
  │           Datos locales
  │
  ├──────────────► Servicios REST
  │                 │
  │                 ▼
  │             JSONPlaceholder
  │
  ├──────────────► Archivos locales
  │
  ▼
Respuesta mostrada al usuario
```

Este diseño permite que cada módulo tenga una responsabilidad específica, facilitando la solución de errores, la incorporación de nuevas funciones y el mantenimiento del proyecto.

