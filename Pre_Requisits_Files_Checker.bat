@ECHO OFF
ECHO ##########################################################################################
ECHO THIS PROGRAM IS TO FIND WHETHER ALL PRE - REQUISIT FILE EXIST IN THE RUNNING FOLDER
ECHO TO GENERATE NRF DFU ZIP FILE
ECHO ##########################################################################################
ECHO.

ECHO 1) CHECKING PRIVATE KEY FILE...
IF EXIST "private.key" (
  ECHO Successfull.
) ELSE (
  ECHO "NOTE : Private Key file Not Found ( Please click Generate_PrivateKey.bat )"
  ECHO.  
)
ECHO.
ECHO.

ECHO 2) CHECKING NRF HEX FILE...
IF EXIST "*.hex" (
  ECHO Successfull.
) ELSE (
  ECHO "NOTE : Please Copy and Paste the NRF Application[dot]hex file"
  ECHO. 
)
ECHO.
ECHO.

ECHO 3) CHECKING NRF UTILITY COMMAND PROMPT...
WHERE nrfutil
IF %ERRORLEVEL% NEQ 0 ECHO Please Install NRF UTILITY APP
ECHO.
ECHO.
pause