# autoscolombia
# Sistema de Gestión de Parqueadero - "Autos Colombia" (EA1 - Iteración 1)

Este repositorio contiene la implementación técnica de la **Evidencia de Aprendizaje 1 (Iteración 1)** para la asignatura de **Ingeniería de Software**.

## Objetivo del Proyecto
Desarrollar un sistema de información para el parqueadero "Autos Colombia" enfocado en la gestión de servicios por mensualidad, control de celdas, registro de novedades y operaciones de entrada y salida de vehículos.

## Alcance de la Iteración 1
- **RF01 a RF07:** Registro de entrada y salida de vehículos con validación de mensualidades vigentes.
- **Gestión de Celdas:** Asignación y liberación automática de celdas en tiempo real.
- **Registro de Novedades:** Documentación de incidencias o estado del vehículo al ingresar y al salir.

## Estructura del Proyecto
- `src/models.py`: Definición de clases de dominio.
- `src/database.py`: Creación del esquema y conexión a la base de datos SQLite.
- `src/services.py`: Reglas de negocio para validación de acceso y control de celdas.
- `src/main.py`: Ejecutable interactivo de consola.

## Instrucciones para Ejecución Local

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/TU_USUARIO/Autos_Colombia_EA1.git
   cd Autos_Colombia_EA1
