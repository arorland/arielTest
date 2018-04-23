*** Settings ***
Library      AppiumLibrary

*** Variables ***
${platformName}  Android
${platformVersion}  5.1
${deviceName}  ariel
${udid}   F6GQINFINJM7I7CQ
${appPackageContacts}   com.android.dialer
${appActivityContacts}   com.android.dialer.DialtactsActivity

*** Keywords ***
Abrir Contactos
  [Documentation]  abre la app de USSD
  Open Application  http://localhost:4723/wd/hub  platformName=${platformName}  udid=${udid}  platformVersion=${platformVersion}  deviceName=${deviceName}  appPackage=${appPackageContacts}  appActivity=${appActivityContacts}

*** Test Cases ***
abrimos
    Abrir Contactos
