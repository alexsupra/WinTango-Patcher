:: takeownres.cmd - script for taking ownership of image resources, run it before WinTango-Patcher v.24
:: for 32/64-bits OS Windows NT 10.0 Pro
:: languages: english, russian
:: https://github.com/alexsupra/WinTango-Patcher
@echo off
if %errorLevel% neq 0 echo Administrative permissions check failure!!&echo Restart as administrator&color 0e &pause &exit
for /f "tokens=2*" %%a in ('reg query "hklm\system\controlset001\control\nls\language" /v "Installlanguage"') do set "systemlang=%%b"

if "%systemlang%"=="0409" goto lang_en
if "%systemlang%"=="0419" goto lang_ru

:lang_ru
chcp 1251
takeown /f %systemroot%\systemresources
icacls %systemroot%\systemresources /grant:r Администраторы:F

takeown /f %systemroot%\systemresources\imageres.dll.mun
icacls %systemroot%\systemresources\imageres.dll.mun /grant:r Администраторы:F

takeown /f %systemroot%\systemresources\imagesp1.dll.mun
icacls %systemroot%\systemresources\imagesp1.dll.mun /grant:r Администраторы:F

takeown /f %systemroot%\systemresources\shell32.dll.mun
icacls %systemroot%\systemresources\shell32.dll.mun /grant:r Администраторы:F
echo. &pause &exit

:lang_en
chcp 866
takeown /f %systemroot%\systemresources
icacls %systemroot%\systemresources /grant:r Administrators:F

takeown /f %systemroot%\systemresources\imageres.dll.mun
icacls %systemroot%\systemresources\imageres.dll.mun /grant:r Administrators:F

takeown /f %systemroot%\systemresources\imagesp1.dll.mun
icacls %systemroot%\systemresources\imagesp1.dll.mun /grant:r Administrators:F

takeown /f %systemroot%\systemresources\shell32.dll.mun
icacls %systemroot%\systemresources\shell32.dll.mun /grant:r Administrators:F
echo. &pause &exit