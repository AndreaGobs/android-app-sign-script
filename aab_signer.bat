@echo OFF
setlocal

set user=andrea
echo Sign .aab file for %user%

set jarsigner_folder="C:\Program Files\Java\jdk-18.0.2\bin"
set aab_unsigned="C:\Users\%user%\Downloads\unsigned.aab"
set aab_signed="C:\Users\%user%\Downloads\signed.aab"
set keystore_file="C:\Keystores\my.keystore"
set keystore_alias="my alias"

rem echo jarsigner: %jarsigner_folder%
echo unsigned: %aab_unsigned%
echo signed: %aab_signed%
rem echo keystore: %keystore_file%
rem echo keystore alias: %keystore_alias%

echo Insert keystore password (in quotes: "example")
set /p password=
echo ...
echo pw: %password%
echo ...

cd %jarsigner_folder%
jarsigner -verbose -sigalg SHA256withRSA -digestalg SHA-256 -keystore %keystore_file% -signedjar %aab_signed% %aab_unsigned% %keystore_alias% -storepass %password%
echo Sign completed

endlocal
pause