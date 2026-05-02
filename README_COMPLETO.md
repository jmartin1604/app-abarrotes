# 🛒 Aplicación Móvil - Abarrotes Del Valle

Aplicación Flutter completa para gestión de pedidos en tienda de abarrotes. Permite a los clientes hacer pedidos y al administrador gestionarlos.

## 🚀 Características

### Para Clientes:
- 📋 **Catálogo de productos** con categorías y búsqueda
- 🛒 **Carrito de compras** con gestión de cantidades
- 📦 **Sistema de checkout** con datos del cliente
- 📊 **Historial de pedidos** con seguimiento de estados
- 🎨 **Interfaz intuitiva** y responsive

### Para Administrador:
- 👨‍💼 **Panel de administración** con tres secciones:
  - Gestión de pedidos (ver y actualizar estados)
  - Gestión de productos (ver y editar)
  - Estadísticas de ventas
- 📈 **Resumen general** del negocio
- ⚡ **Acciones rápidas** para gestión

## 🏗️ Estructura del Proyecto

```
app-abarrotes-mobile/
├── lib/
│   ├── main.dart                    # Punto de entrada
│   ├── models/                      # Modelos de datos
│   │   ├── product.dart             # Modelo Producto
│   │   ├── cart_item.dart           # Modelo Item Carrito
│   │   └── order.dart               # Modelo Pedido
│   ├── providers/                   # State management
│   │   ├── products_provider.dart   # Provider Productos
│   │   ├── cart_provider.dart       # Provider Carrito
│   │   └── orders_provider.dart     # Provider Pedidos
│   ├── screens/                     # Pantallas
│   │   ├── home_screen.dart         # Pantalla Inicio
│   │   ├── products_screen.dart    # Pantalla Productos
│   │   ├── cart_screen.dart         # Pantalla Carrito
│   │   ├── orders_screen.dart       # Pantalla Pedidos
│   │   ├── admin_screen.dart        # Pantalla Administrador
│   │   └── product_detail_screen.dart # Detalle Producto
│   ├── widgets/                     # Componentes reutilizables
│   │   ├── product_card.dart        # Tarjeta Producto
│   │   ├── product_grid.dart        # Grid Productos
│   │   ├── cart_item_widget.dart    # Widget Item Carrito
│   │   ├── order_card.dart          # Tarjeta Pedido
│   │   └── order_summary_card.dart   # Resumen Pedido
│   ├── theme/                       # Tema de la app
│   │   └── app_theme.dart           # Configuración tema
│   └── utils/                       # Utilidades
├── android/                         # Configuración Android
├── pubspec.yaml                     # Dependencias
└── README.md                        # Documentación
```

## 🛠️ Tecnologías Utilizadas

- **Flutter 3.19+** - Framework multiplataforma
- **Dart 3.0+** - Lenguaje de programación
- **Provider** - State management
- **Material Design** - Diseño de interfaz
- **Android SDK** - Para generación de APK

## 📦 Instalación y Ejecución

### Prerrequisitos:
1. **Flutter SDK** instalado
2. **Android Studio** con emulador o dispositivo físico
3. **Git** para clonar el repositorio

### Pasos:

1. **Clonar el repositorio:**
```bash
git clone https://github.com/jmartin1604/app-abarrotes.git
cd app-abarrotes
```

2. **Obtener dependencias:**
```bash
flutter pub get
```

3. **Ejecutar la aplicación:**
```bash
# En emulador Android
flutter run

# En navegador web
flutter run -d chrome

# En dispositivo Android físico
flutter run -d <device-id>
```

## 📱 Generación de APK

### Para desarrollo:
```bash
flutter build apk --debug
```

### Para producción:
```bash
flutter build apk --release
```

### APK dividido por arquitectura (recomendado):
```bash
flutter build apk --split-per-abi --release
```

## 🔧 Configuración

### Personalizar colores:
Editar `lib/theme/app_theme.dart`

### Modificar datos iniciales:
Editar los providers en `lib/providers/`

### Agregar nuevas funcionalidades:
1. Agregar nuevas pantallas en `lib/screens/`
2. Agregar nuevos widgets en `lib/widgets/`
3. Agregar nuevos modelos en `lib/models/`

## 📊 Características Técnicas

- ✅ **State Management** con Provider
- ✅ **Diseño Material Design** personalizado
- ✅ **Navegación** entre pantallas
- ✅ **Validación** de formularios
- ✅ **Mensajes** de confirmación y error
- ✅ **Datos de ejemplo** preconfigurados
- ✅ **Responsive design** para diferentes dispositivos

## 🚀 Despliegue

### Para Google Play Store:
```bash
flutter build appbundle --release
```

### Configurar firma digital:
1. Crear keystore:
```bash
keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
```

2. Configurar `android/key.properties`

## 🤝 Contribución

1. Fork el proyecto
2. Crear rama de características (`git checkout -b feature/AmazingFeature`)
3. Commit cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir Pull Request

## 📄 Licencia

Distribuido bajo la licencia MIT. Ver `LICENSE` para más información.

## 📞 Contacto

jmartin1604 - [GitHub](https://github.com/jmartin1604)

Link del proyecto: [https://github.com/jmartin1604/app-abarrotes](https://github.com/jmartin1604/app-abarrotes)

## 🙏 Agradecimientos

- [Flutter Team](https://flutter.dev)
- [Provider Package](https://pub.dev/packages/provider)
- [Material Design](https://material.io)

---
**Nota:** Esta aplicación es un prototipo funcional y puede ser extendida con backend, autenticación, pagos en línea, notificaciones push, etc.