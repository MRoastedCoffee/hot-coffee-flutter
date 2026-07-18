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
| **Universidad**        | *Universidad Politénica de la Región Ribereña*                     |
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

