@echo OFF
setlocal

set user=andrea
echo Sign .apk file for %user%

rem zipalign and apksigner located in android-sdk build-tools folder
set buildtools_folder="C:\android\android-sdk\build-tools\33.0.0-rc1"
set apk_unsigned="C:\Users\%user%\Downloads\unsigned.apk"
set apk_aligned="C:\Users\%user%\Downloads\aligned.apk"
set apk_signed="C:\Users\%user%\Downloads\signed.apk"
set keystore_file="C:\Keystores\my.keystore"
rem set keystore_alias="my alias"

rem echo jarsigner: %buildtools_folder%
echo unsigned: %apk_unsigned%
echo aligned: %apk_aligned%
echo signed: %apk_signed%
rem echo keystore: %keystore_file%
rem echo keystore alias: %keystore_alias%

cd %buildtools_folder%
zipalign -v -p 4 %apk_unsigned% %apk_aligned%
echo Align completed
call apksigner sign -v --ks %keystore_file% --out %apk_signed% %apk_aligned%
echo Sign completed
call apksigner verify -v %apk_signed%
echo Verify completed

endlocal
pause