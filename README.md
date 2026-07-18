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