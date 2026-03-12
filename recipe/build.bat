dart pub get
if %ERRORLEVEL% NEQ 0 exit 1

dart run grinder protobuf
if %ERRORLEVEL% NEQ 0 exit 1

dart compile exe --define="version=%PKG_VERSION%" bin\sass.dart -o %LIBRARY_BIN%\sass.exe
if %ERRORLEVEL% NEQ 0 exit 1
