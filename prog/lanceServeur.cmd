@echo off
echo active l'environnement virtuel base pour python
echo.
call C:\Python310\EnVir\Base\Scripts\activate.bat
python serveurweb.py 
call C:\Python310\EnVir\Base\Scripts\deactivate.bat
rem