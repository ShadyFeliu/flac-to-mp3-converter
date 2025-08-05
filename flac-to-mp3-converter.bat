@echo off
setlocal ENABLEDELAYEDEXPANSION

:: CONFIGURA RUTAS
set "INPUT_FOLDER=C:\MusicaFLAC"
set "OUTPUT_FOLDER=C:\MusicaMP3"
set "FFMPEG_PATH=C:\ffmpeg\bin\ffmpeg.exe"

:: CREA LA CARPETA DE SALIDA SI NO EXISTE
if not exist "%OUTPUT_FOLDER%" (
    mkdir "%OUTPUT_FOLDER%"
)

echo -----------------------------------------
echo CONVIRTIENDO FLAC A MP3 CON FORMATO DE ARTISTA LIMPIO
echo -----------------------------------------

:: RECORRE TODOS LOS FLAC EN LA CARPETA DE ENTRADA
for %%f in ("%INPUT_FOLDER%\*.flac") do (
    set "INPUT_FILE=%%f"
    set "FILENAME=%%~nf"
    echo Procesando: !INPUT_FILE!

    :: OBTENER ARTISTA ORIGINAL
    for /f "usebackq tokens=* delims=" %%A in (`powershell -NoProfile -Command ^
        "(Get-Content -Raw -Encoding Byte '%%f' | ffmpeg -i - -f ffmetadata -hide_banner -loglevel quiet - 2^>^&1) ^
        | Select-String 'artist=' ^
        | ForEach-Object { ($_ -replace '^artist=','') -replace '[;/|]', ', ' }"`) do (
        set "CLEAN_ARTIST=%%A"
    )

    echo Artista formateado: !CLEAN_ARTIST!

    :: CONVERTIR A MP3 CON METADATA CORREGIDA
    "%FFMPEG_PATH%" -i "!INPUT_FILE!" -codec:a libmp3lame -b:a 320k -id3v2_version 3 -metadata artist="!CLEAN_ARTIST!" "%OUTPUT_FOLDER%\!FILENAME!.mp3"
)

echo -----------------------------------------
echo CONVERSION COMPLETA
echo Archivos listos en: %OUTPUT_FOLDER%
echo -----------------------------------------
pause
