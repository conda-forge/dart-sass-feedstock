@REM for /f %%i in ('python -c "import subprocess; out = subprocess.check_output(['dart', '--version']); print(out.decode().split()[3])"') do set DART_VERSION=%%i
@REM dart pub get
@REM dart compile exe bin\sass.dart -Dversion=%PKG_VERSION% -Ddart-version=%DART_VERSION% -o %LIBRARY_BIN%\sass.exe

:: Copy Dart's license into _h_env, because the grinder task copies it
COPY %RECIPE_DIR%\dart_license %PREFIX%\LICENSE
dart run grinder pkg-standalone-windows-x64

cd build
tar -xf dart-sass-%PKG_VERSION%-windows-x64.zip
cd dart-sass
COPY sass.bat %LIBRARY_BIN%\sass.bat

robocopy /E "src" "%LIBRARY_BIN%\src"
if %ERRORLEVEL% GEQ 8 exit 1
