@echo off
echo ****************************************
echo **   Creation du site pour Francis    **
echo ********************************* V.2 **
echo .
echo Pour fonctionner, cela necessite le langague python
echo           et les bibliotheques : bottle, csv, argparse, html, io ,os
echo .
set versionsite=SiteGITHUB
rem les variables de chez guy et de chez francis
IF "%HOMEPATH%" EQU "\Users\easy" (
set racine=E:\%versionsite%
) ELSE (
set racine=G:\test\FrancisBoulanger\github\Hébreu
)
set version=3.0
echo.
echo ****************************************
echo **        Cree les dossiers           **
echo ****************************************
echo.
if not exist %racine%\html (mkdir %racine%\html)
rem if not exist %racine%\html\TDM (mkdir %racine%\html\TDM)
rem if not exist %racine%\html\mef (mkdir %racine%\html\mef)
echo.
echo ****************************************
echo ** Ouvre environnement virtuel python **
echo ****************************************
echo.
IF "%HOMEPATH%" EQU "\Users\easy" (
call C:\Python310\EnVir\Base\Scripts\activate
) ELSE (
call C:\virPy11\Scripts\activate
)
echo.
echo ****************************************
echo **         Cree la version %version%        **
echo ****************************************
echo.
cd %racine%\prog
python genereSiteFrancis.%version%%.py
goto :sauteindex
echo.
echo ****************************************
echo **            Cree l'index            **
echo ****************************************
echo.
rem python genereIndex.py
:sauteindex
echo.
echo ****************************************
echo **     retouche les fichiers html     **
echo ****************************************
echo.
python mefHTML03.py
echo.
echo ****************************************
echo **     Cree la table des matieres     **
echo ****************************************
echo.
python genereTDM.py -o../htmlR/TDM.html
echo.
echo *******************************************************
echo **     copy les fichiers html dans leurs dossiers    **
echo *******************************************************
echo.
rmdir /S /Q ..\html
xcopy ..\htmlR\*.* ..\html\*.*
xcopy /s ..\complements\aCopier\*.* ..\html\*.*
if not exist %racine%\mef (mkdir %racine%\mef)
xcopy /s ..\complements\mef\*.* ..\mef\*.*
rmdir /S /Q ..\htmlR
echo.
echo ****************************************
echo **     Lance le serveur web local     **
echo ****************************************
echo.
rem ##############################################################""
call lanceServeur.cmd
echo.
echo