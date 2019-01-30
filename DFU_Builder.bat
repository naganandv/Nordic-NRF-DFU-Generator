:: TEMPLATE OF COMMAND
::--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
:: nrfutil pkg generate --hw-version %HardwareVersion% --sd-req %SdkReq% --application-version %version% --application [ nrf51422_xxac.hex ] --key-file [ private.key] app_dfu_package_%dtStamp%_V_%version%.zip
:: ----------------------------------------------------------------------------------------------------------------------[NRF APP HEX FILE]----------[ PRIVATE KEY FILE ]---------------------------------------                                                                                                                              
:: OTHER THAN THIS EVERYTHING REMAINS UNTOUCHED FOR PROPER WORKING
:: PLEASE DO NOT CHANGE ANY THING UPTO HERE
:: BELOW CODE FOR TIME STAMPING THE ZIP FILE
:: ZIP FILE WILL BE GENERATED IN TEMPLATE OF 
:: app_dfu_package_YYYY-MM_HHMMSS_V_Version_ZIP
:: YYYY : Year  ( Ex: 2019 )
:: MM   : Month ( Ex: 01   )
:: HH : Hours MM : Minuts SS: Seconds
:: Version : File Version Number ( Also Number of times you have created the ZIP file )

@ECHO OFF

SET HardwareVersion=51
SET SdkReq=0x87

SET HOUR=%time:~0,2%
SET dtStamp9=%date:~-4%%date:~4,2%%date:~7,2%_0%time:~1,1%%time:~3,2%%time:~6,2% 
SET dtStamp24=%date:~-4%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)

:: END OF TIME STAMPING THE ZIP FILE

SETLOCAL

REM Load variables
IF EXIST configMine.txt FOR /F "delims=" %%A IN (configMine.txt) DO SET "%%A"

REM Change variables
IF NOT DEFINED $versionCount (
    SET $versionCount=1
) ELSE SET /A $versionCount+=1

SET version=%$versionCount%

REM Save variables
SET $>configMine.txt

if exist "*.zip" (
        del "%cd%\*.zip" /f /s /q
        ECHO NRFUTILITY BUILDER BATCH FILE V1.0 RUNNING
	ECHO ###################################################################################################################
        ECHO STARTED BUIDLING THE ZIP FILE ENDING WITH VERSION %version% 
        ECHO ###################################################################################################################
        :: COPY CUSTOM COMMAND BELOW [ IF ANY ]
 	nrfutil pkg generate --hw-version %HardwareVersion% --sd-req %SdkReq% --application-version %version% --application nrf51422_xxac.hex --key-file private.key app_dfu_package_%dtStamp%_V_%version%.zip
  
    ) else (

      ECHO NRFUTILITY BUILDER BATCH FILE V1.0 RUNNING
      ECHO ###################################################################################################################
      ECHO STARTED BUIDLING THE ZIP FILE ENDING WITH VERSION %version%
      ECHO ###################################################################################################################
      :: COPY CUSTOM COMMAND BELOW [ IF ANY ]
      nrfutil pkg generate --hw-version %HardwareVersion% --sd-req %SdkReq% --application-version %version% --application nrf51422_xxac.hex --key-file private.key app_dfu_package_%dtStamp%_V_%version%.zip
    )
ENDLOCAL
PAUSE