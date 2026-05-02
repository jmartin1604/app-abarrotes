# Instrucciones para Construir el APK

## Requisitos Previos

1. **Flutter SDK** instalado y configurado
2. **Android Studio** con SDK de Android
3. **Java JDK** (versión 11 o superior)
4. **Dispositivo Android físico o emulador** para pruebas

## Pasos para Construir el APK

### 1. Configurar el entorno Flutter

```bash
# Verificar instalación de Flutter
flutter doctor

# Si hay problemas, seguir las instrucciones de flutter doctor
```

### 2. Navegar al proyecto

```bash
cd app-abarrotes-mobile
```

### 3. Obtener dependencias

```bash
flutter pub get
```

### 4. Probar la aplicación

```bash
# Conectar un dispositivo Android o iniciar un emulador
flutter run
```

### 5. Construir APK para release

```bash
# Construir APK
flutter build apk --release

# El APK se generará en:
# build/app/outputs/flutter-apk/app-release.apk
```

### 6. Construir APK dividido (recomendado para distribución)

```bash
# Para reducir el tamaño del APK
flutter build apk --split-per-abi --release

# Esto generará tres APKs:
# app-armeabi-v7a-release.apk
# app-arm64-v8a-release.apk  
# app-x86_64-release.apk
```

## Instalación del APK

### En dispositivo físico:

1. Conectar el dispositivo Android via USB
2. Habilitar "Depuración USB" en Opciones de Desarrollador
3. Ejecutar:
```bash
flutter install
```

### O transferir manualmente:

1. Copiar el archivo APK al dispositivo
2. Habilitar "Orígenes desconocidos" en Configuración de Seguridad
3. Abrir el archivo APK e instalar

## Configuración Adicional

### Para publicar en Google Play Store:

```bash
# Generar bundle para Play Store
flutter build appbundle --release

# El bundle se generará en:
# build/app/outputs/bundle/release/app-release.aab
```

### Para firmar el APK:

1. Crear una clave de firma:
```bash
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

2. Configurar `android/key.properties`:
```
storePassword=<password>
keyPassword=<password>
keyAlias=key
storeFile=/path/to/key.jks
```

3. Configurar `android/app/build.gradle`:
```gradle
android {
    ...
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
        }
    }
}
```

## Características de la Aplicación

### Para Clientes:
- ✅ Catálogo de productos con categorías
- ✅ Carrito de compras con gestión de cantidades
- ✅ Historial de pedidos con estados
- ✅ Sistema de checkout con datos del cliente
- ✅ Interfaz intuitiva y responsive

### Para Administrador:
- ✅ Panel de administración con tres secciones
- ✅ Gestión de pedidos (ver y actualizar estados)
- ✅ Gestión de productos (ver y editar)
- ✅ Estadísticas de ventas
- ✅ Resumen general del negocio

### Características Técnicas:
- ✅ State management con Provider
- ✅ Diseño Material Design
- ✅ Navegación entre pantallas
- ✅ Persistencia de datos (en memoria)
- ✅ Validación de formularios
- ✅ Mensajes de confirmación y error

## Personalización

### Para cambiar colores:
Editar `lib/theme/app_theme.dart`

### Para cambiar datos iniciales:
Editar los providers en `lib/providers/`

### Para agregar nuevas funcionalidades:
1. Agregar nuevas pantallas en `lib/screens/`
2. Agregar nuevos widgets en `lib/widgets/`
3. Agregar nuevos modelos en `lib/models/`

## Solución de Problemas

### Error: "Flutter command not found"
- Asegurar que Flutter está en el PATH
- Reiniciar la terminal

### Error: "No connected devices"
- Conectar un dispositivo Android via USB
- Iniciar un emulador desde Android Studio
- Verificar que la depuración USB está habilitada

### Error al construir APK
- Verificar versión de Flutter: `flutter --version`
- Verificar espacio en disco
- Limpiar cache: `flutter clean`

### La aplicación se cierra al abrir
- Verificar logs: `flutter logs`
- Probar en modo debug: `flutter run --debug`

## Recursos Adicionales

- [Documentación Oficial de Flutter](https://flutter.dev/docs)
- [Guía de Publicación en Play Store](https://flutter.dev/docs/deployment/android)
- [Tutoriales de Flutter](https://flutter.dev/docs/cookbook)

## Licencia

Esta aplicación es de código abierto y puede ser modificada según tus necesidades.