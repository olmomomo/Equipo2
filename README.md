# Abarrotes La Gloria – Sistema de Gestión

**Abarrotes La Gloria** es un sistema de gestión de negocios desarrollado en **Java** (utilizando **Swing/JavaFX** y **MySQL** como base de datos) diseñado específicamente para administrar las operaciones clave de una tienda o abarrotera, incluyendo **ventas**, **compras**, **productos**, **usuarios** y **proveedores**.

Permite llevar un **control de inventario** preciso, registrar todas las operaciones financieras y consultar información de manera **rápida y organizada**.

---

## Descripción General del Proyecto

El sistema está diseñado para ser una herramienta **práctica, rápida y sencilla** para la administración de procesos internos en **negocios pequeños y medianos**.

### Componentes Especiales y Módulos Esenciales

El sistema incorpora dos componentes clave para la funcionalidad y la interfaz:

* **Slide Menu:** Utilizado para mejorar la **navegación y la experiencia del usuario (UX)**.
* **Captcha Cadenas:** Implementado en el inicio de sesión o recuperación de contraseña para una **validación de seguridad** mejorada.

Además de los componentes anteriores, los módulos principales son:

* **Inicio de Sesión (Login)**
* **Gestión de Productos** (Inventario)
* **Registro de Ventas** y Pagos
* **Control de Compras** a Proveedores
* **Administración de Usuarios**
* **Recuperación de Contraseña**
* **Consultas** (Historial de Compras y Ventas)

---

##  Características Principales

| Módulo | Icono | Descripción Detallada |
| :--- | :---: | :--- |
| **Autenticación (Login)** | | Valida credenciales, controla intentos fallidos y permite el acceso seguro. |
| **Mi Perfil** | | Permite al usuario consultar y actualizar sus datos personales. |
| **Pago de Venta** | | Procesa pagos, calcula totales automáticamente y genera el registro final de la venta. |
| **Productos** | | Registra, consulta y modifica productos, incluyendo la gestión de su **inventario**. |
| **Proveedores** | | Administra la información de proveedores; permite agregar o actualizar registros. |
| **Recuperar Contraseña** | | Facilita el restablecimiento de contraseña mediante validaciones seguras. |
| **Registrar Usuario** | | Crea nuevos usuarios dentro del sistema con validación de datos y duplicados. |
| **Venta** | | Registra la venta, calcula montos totales automáticamente y genera el comprobante interno. |
| **Ver Compra** | | Permite consultar y ver el detalle de compras registradas previamente. |
| **Ver Info Usuario** | | Muestra información detallada de un usuario específico. |
| **Ver Usuario** | | Lista todos los usuarios registrados y permite aplicar filtros. |
| **Ver Venta** | | Muestra el historial completo de ventas con detalles. |

---

## Tecnologías Utilizadas

| Categoría | Tecnología | Notas |
| :--- | :--- | :--- |
| **Lenguaje** | **Java 8+** | |
| **IDE** | **NetBeans** / Apache NetBeans | Entorno de desarrollo utilizado. |
| **Base de Datos** | **MySQL** | |
| **Conexión DB** | **JDBC** | Driver estándar para conexión. |
| **Interfaz Gráfica** | **Swing** (o JavaFX, según el proyecto) | |
| **Arquitectura** | Formularios y Controladores (MVC básico) | Separación de lógica de negocio y presentación. |
| **Librerías Adicionales** | **JCommon** & **JFreeChart** | Utilizadas para la **generación de gráficos y reportes** visuales. |
| **Librerías de Conexión** | **MySQL Connector** | Implementación del controlador de MySQL. |
| **Librerías de Activación** | `activation-1.1`, `jakarta.activation` | Librerías para manejar la activación de Java Beans y extensiones. |
---

## Pruebas y Validaciones

El sistema ha sido evaluado rigurosamente. Las pruebas funcionales y no funcionales están documentadas en un archivo de Excel adjunto.

### Pruebas Funcionales

Se enfocaron en validar que las operaciones y la lógica de negocio funcionen según lo esperado:

* Validación de credenciales en *login*.
* Cálculo automático de totales (ventas y pagos).
* Registro exitoso de ventas y compras.
* Edición y eliminación de registros.
* Validación de campos de entrada de datos.
* Flujo completo y correcto de cada módulo.

### Pruebas No Funcionales

Se evaluaron aspectos relacionados con la experiencia de usuario y el rendimiento:

* Tiempos de carga de módulos y ventanas.
* Estabilidad general del sistema.
* Fluidez en la navegación entre las interfaces.
* Consistencia de la interfaz de usuario (UI).

> **Resultado:** Cada módulo opera correctamente, cumpliendo con los requisitos de funcionalidad y rendimiento.

---
La estructura incluye clases esenciales para la **conexión a la base de datos**, operaciones **CRUD**, manejo de **ventanas gráficas** y **validaciones**.

---

## Cómo Ejecutar el Proyecto

Sigue estos pasos para poner en marcha el sistema:

1.  **Clonar el repositorio:**
    ```bash
    git clone [https://github.com/usuario/AbarrotesLaGloria](https://github.com/usuario/AbarrotesLaGloria)
    ```

2.  **Abrir en NetBeans:**
    * Ve a `File` → `Open Project` → Selecciona la carpeta `AbarrotesLaGloria`.

3.  **Configurar la base de datos:**
    * **Importar** el archivo SQL (`database.sql` o similar, si está incluido) en tu servidor MySQL.
    * **Ajustar** el usuario y contraseña de la base de datos dentro de la clase de conexión JDBC (generalmente en `/src/database/Conexion.java` o similar).

4.  **Ejecutar el proyecto:**
    * Haz clic en `Run` → `Run Project` (o presiona **F6**).

---

![Login](capturasAbaLaGloria/login.png)


## Autores / Créditos

Proyecto desarrollado como parte de la materia correspondiente.

| Nombre | Número de control |
| :--- | :--- |
| **Bustamante Rios Flor Estephany** | 22161011 |
| **Cruz Martínez Andrea Joselin** | 22161040 |
| **Jiménez López Fernando Arath** | 22161107 |
| **Olmos Reyes Ittay Ayelen** | 22161688 |
