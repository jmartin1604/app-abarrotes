# Guía Simple para Probar la Aplicación

## Opción 1: Usar Flutter Web (Más Fácil)

### 1. Instalar Flutter rápidamente:

**Para Windows:**
1. Descarga desde: https://flutter.dev/docs/get-started/install/windows
2. Extrae a: `C:\flutter`
3. Agrega al PATH: `C:\flutter\bin`
4. Abre PowerShell como Administrador y ejecuta:
```powershell
setx PATH "%PATH%;C:\flutter\bin"
```

### 2. Probar como aplicación web:

```bash
# Navegar al proyecto
cd app-abarrotes-mobile

# Obtener dependencias
flutter pub get

# Ejecutar como web
flutter run -d chrome
```

Esto abrirá la aplicación en tu navegador Chrome.

## Opción 2: Usar un Emulador Online

1. Ve a: https://dartpad.dev
2. Copia y pega código básico para probar
3. O usa: https://snack.expo.dev (para React Native)

## Opción 3: Te ayudo a crear una versión web PWA

Puedo convertir la aplicación a una Progressive Web App que puedas probar directamente en el navegador.

## Opción 4: Generar APK sin Flutter instalado

Necesitarías:
1. **Docker** instalado
2. Ejecutar:
```bash
docker run --rm -v $(pwd):/app -w /app cirrusci/flutter flutter build apk
```

## Pasos Recomendados (Más Sencillo):

### Paso 1: Verifica si tienes Chocolatey (gestor de paquetes Windows)
```powershell
choco --version
```

### Paso 2: Instalar Flutter con Chocolatey (si lo tienes)
```powershell
choco install flutter
```

### Paso 3: O instalar manualmente:
1. Descarga el ZIP de: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.19.0-stable.zip
2. Extrae a `C:\flutter`
3. Ejecuta en PowerShell:
```powershell
[System.Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\flutter\bin", "User")
```

### Paso 4: Probar la app:
```powershell
cd app-abarrotes-mobile
flutter pub get
flutter run -d chrome
```

## Solución Rápida:

Si no quieres instalar nada, puedo:
1. **Crear una versión web HTML/CSS/JS** de la aplicación
2. **Generar el APK por ti** (necesito permisos)
3. **Crear un instalador .exe** para Windows

## ¿Qué prefieres?

1. **Instalar Flutter** y probar la app completa ✓
2. **Versión web PWA** que funciona en navegador ✓
3. **APK generado** para instalar en Android ✓
4. **Otra solución** (especifica)

Dime qué opción prefieres y te ayudo con ella.