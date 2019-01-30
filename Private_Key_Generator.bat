@ECHO OFF
ECHO ##########################################################################################
ECHO THIS PROGRAM IS TO GENERATE PRIVATE KEY FILE
ECHO ##########################################################################################
ECHO.
nrfutil keys generate private.key
ECHO.
nrfutil keys display --key pk --format code private.key
ECHO.
pause