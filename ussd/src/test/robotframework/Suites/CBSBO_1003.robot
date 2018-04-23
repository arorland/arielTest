*** settings ***
Documentation   Prueba de Ingreso de subcriptor invalido
Library   SeleniumLibrary
Library        DateTime
Metadata   Link for CBSBO-1003    https://jira.tigo.net.bo/browse/CBSBO-1003

*** variables ***
##Variables GENERALES-----------------------------------------
${url}    https://www.google.com.bo/
${browser}    firefox
${delay}    1
${usuario}    ayalaer
${contrasena}   Selectcount(1)
${idUser}  formLogin:usernameId
${idPassword}   formLogin:passwordId
${numCelular}   79676094
${TYPE OF FILE}  png
##Button------------------------------------------------------
${idBtnIngresar}   formLogin:comanLogin
${idBtnValidar}   form_cuenta:j_idt63
${idBtnBuscar}    id=form_tab:tabView:buttomSearch
##Links-------------------------------------------------------
${linkCallCenter}   link=CallCenter/Sac
${linkCCC}   link=CCC
${idCuenta}    form_cuenta:itIsdn
##Checkbox----------------------------------------------------
${idCheck}    xpath=//table[@id='form_tab:tabView:gridCheck']/tbody/tr[4]/td/div/div[2]/span
${elem}   id=j_idt28

*** keywords ***
Get DateTime
  ${date1}=  Get Current Date  result_format=%Y-%m-%d %H-%M-%S
  [Return]     ${date1}

Abrir Navegador
    [Documentation]   Ingresamos al Navegador
    Open Browser    ${url}  ${browser}
    Maximize Browser Window

Introducir Contrasena
    [Documentation]   Introducimos Usuario y Contraseña
    Input Text    ${idUser}   ${usuario}
    Input Text    ${idPassword}   ${contrasena}
    Click Button    ${idBtnIngresar}

Ingresar Consulta
    [Documentation]   Generamos Consulta
    Focus   ${linkCallCenter}
    Click Link   ${linkCallCenter}
    Wait Until Element Is Visible   ${linkCCC}    5
    Click Link   ${linkCCC}

Introducimos Numero
    [Documentation]   Introducimos el Numero de Consulta
    Input Text    ${idCuenta}   ${numCelular}
    Click Button    ${idBtnValidar}

Screenshot
    ${Date}  Get DateTime
    Set Global Variable  ${Path}  Screenshot/CBSBO-1003/
    Set Screenshot Directory  ${Path}
    Sleep    3s
    Capture Page Screenshot  ${Date}.${TYPE OF FILE}

*** Test Cases ***
Subcriptor Invalido
    [Documentation]   Prueba CBSBO-1003 "SUBCRIPTORES INVALIDOS"
    Abrir Navegador
    #Introducir Contrasena
    #Ingresar Consulta
    #Introducimos Numero
    #Screenshot
    Close Browser
