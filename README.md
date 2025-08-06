# 🎧 FLAC to MP3 Converter (Batch Script)

Este repositorio contiene un script `.bat` para Windows que convierte múltiples archivos **FLAC** a **MP3 (320 kbps)** de forma automática, preservando los metadatos y asegurando la **máxima compatibilidad con Rekordbox y CDJs de Pioneer**.

Ideal para DJs, coleccionistas o productores que quieren una colección bien organizada y legible por Rekordbox, incluyendo nombres de artista correctamente formateados.

---

## 🧩 ¿Qué hace este script?

✅ Convierte todos los archivos `.flac` de una carpeta a `.mp3` con calidad **CBR 320 kbps**  
✅ Corrige el campo `artist`, separando múltiples artistas con **coma + espacio**  
✅ Mantiene metadatos como título, álbum, año, etc.  
✅ Usa etiquetas **ID3v2.3**, necesarias para que Rekordbox muestre bien las carátulas y metadata  
✅ Guarda los `.mp3` en una carpeta lista para importar directamente en Rekordbox  
✅ No modifica tus archivos `.flac` originales

---

## 📦 Requisitos

- [FFmpeg](https://ffmpeg.org/) instalado localmente
- Windows (con PowerShell habilitado, viene por defecto)
- Archivos `.flac` con metadatos básicos (mínimo título y artista)

---

## 🔧 Instalación de FFmpeg en Windows

1. Visita: [https://ffmpeg.org/download.html](https://ffmpeg.org/download.html)
2. Haz clic en **"Windows builds from gyan.dev"** (u otra fuente confiable).
3. Descarga el archivo `.zip` completo.
4. Extrae el contenido en una carpeta, por ejemplo:  
