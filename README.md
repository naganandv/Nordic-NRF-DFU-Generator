# Nordic-NRF-DFU-Generator
This a alpha stage program to generate DFU Zip packages for Over the Air Update for Nordic BLE IC's
Program validates and generates DFU zip file required for the Nodic BLE IC's.


# Pre Requisits
* Python 2.7 ( greater than 2.7.10 ) ( Latest Release Download : https://www.python.org/downloads/release/python-2713/ )
* Connect to internet

# Running and Generating
* Start with running ( double clicking ) Private_Key_Generator.bat
* It should generate "private.key" file
* Copy & Paste the Nordic Application file ( *.hex file )
* Run Pre_Requisits_Files_Checker.bat just to make sure all files are there to generate DFU file.
* Once files are checked and found successfully , Run DFU_Builder.bat to generate the zip file

# Template of DFU 
* nrfutil pkg generate --hw-version %HardwareVersion% --sd-req %SdkReq% --application-version %version% --application [ nrf51422_xxac.hex ] --key-file [ private.key] app_dfu_package_%dtStamp%_V_%version%.zip

# Template of Zip file
* app_dfu_package_YYYY-MM_HHMMSS_V_Version_ZIP
* YYYY : Year  ( Ex: 2019 )
* MM   : Month ( Ex: 01   )
* HH : Hours MM : Minuts SS: Seconds
* Version : File Version Number ( Also Number of times you have created the ZIP file )

