# Aplicación Móvil - Abarrotes Del Valle

Aplicación Flutter para gestión de pedidos en tienda de abarrotes.

## Características

### Para Clientes:
- Catálogo de productos
- Carrito de compras
- Historial de pedidos
- Seguimiento de pedidos
- Perfil de usuario

### Para Administrador:
- Gestión de productos
- Visualización de pedidos
- Actualización de estados
- Estadísticas de ventas

## Estructura del Proyecto

```
lib/
├── main.dart              # Punto de entrada
├── models/               # Modelos de datos
├── providers/           # State management
├── screens/             # Pantallas
├── widgets/             # Componentes reutilizables
├── services/            # Servicios (API, etc.)
└── utils/               # Utilidades
```

## Requisitos

- Flutter SDK 3.0 o superior
- Dart 3.0 o superior
- Dispositivo Android para pruebas

## Instalación

1. Clonar el repositorio
2. Ejecutar `flutter pub get`
3. Ejecutar `flutter run`

## Build APK

```bash
flutter build apk --release
```

## Licencia

MIT