# Conjunto de instrucciones para realizar cambios u desbloqueos de usuarios en Active Directory
# Se importa las dependencias necesarias para que funcione el script

#variables globales
[String] $moduleActive = "ActiveDirectory"

# Menu para desbloqueos de usuarios
function unlockUser () {
    Clear-Host
    [Boolean] $isUnlock = $false
    [String] $usuario = $null
    [String] $domain = $null;
    [String] $isTryAgain = $null;

    while(!$isUnlock){
        try {
            Write-Host "*****************************"
            Write-host "    Desbloqueo de usuario    "
            Write-Host "*****************************"
            [String] $usuario = Read-Host "Usuario:  "
            [String] $domain = Read-Host "Dominio: "
            Write-Host "*****************************"
            # validaciones sobre los datos obtenidos
            if( $usuario -eq "" -or $domain -eq "" ){
                throw "Usuario vacio y dominio desconocido, intenta nuevamente"
            }
            if( !(findDomain $domain) ){
                throw "Dominio no encontrado, intenta nuevamente"
            }
            # Desbloquear cuenta si todo esta correcto
            $usuario | Unlock-ADAccount -Server (findDomain $domain)
            $isUnlock = $true;
        }
        catch {
           Write-Error $_
        }
    }
    # Evaluar condicion por si necesita desbloquear otro usuario
    [Boolean] $isTryAgain = (Read-Host "¿Deseas desbloquear otro usuario?: S / N ") -eq 'S'
    # Funcion recursiva si en caso se necesitara desbloquear otro usuario
    if ( $isTryAgain ) { unlockUser }
    return main
}

function findDomain {
    <#
    .SYNOPSIS
    Funcion para retornar si existe el dominio
    
    .DESCRIPTION
    Funcion para realizar el desbloqueo del usuario de Active Directory
    
    .PARAMETER domain
    variable de tipo string para evaluar los dominios correspondientes

    .EXAMPLE
    function => ( $domain = 'GT' | 'HN' | 'SV' | 'CR' | 'NI' | 'PA'  ) => retorna en cadena el dominio por pais
    #>
    param(
        [String] $domain
    )
    # fucntion body
    switch( $domain.ToUpper()){
        'GT' { return 'clarogt.americamovil.ca1' }
        'SV' { return 'telecom.americamovil.ca1' }
        'CR' { return 'clarocr.americamovil.ca1' }
        'HN' { return 'clarohn.americamovil.ca1' }
        'NI' { return 'claroni.americamovil.ca1' }
        'PA' { return 'claropa.americamovil.ca1' }
        Default { return '' }
    }

}
function changePasswordUser(){
    Clear-Host
    [Boolean] $isChangePassword = $false;
    while( !$isChangePassword ){
        try {
            Write-Host "*****************************"
            Write-host " Cambio de contraseña de red "
            Write-Host "*****************************"
            [String] $usuario = Read-Host "Usuario"
            [String] $contrasenia = Read-Host "Contrasenia"
            [String] $domain = Read-Host "Dominio"
            Write-Host "*****************************"
            #validaciones sobre los campos enviados
            if( $usuario -eq "" -or $contrasenia -eq "" -or $domain -eq ""){
                throw "Usuario y/o contrasenia y/o dominio son necesarios, intenta de nuevo"
            }
            if( !(findDomain $domain) ){
                throw "Dominio no encontrado, intenta nuevamente"
            }
            #Cambiar contraseña si todo esta correcto
            $usuario | Set-ADAccountPassword -Server (findDomain $domain) -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $contrasenia -Force)
            $isChangePassword = $true;
        }
        catch {
           Write-Error $_
        }
    }
    # Evaluar condicion por si necesita cambiar contraseña a otro usuario
    [Boolean] $isTryAgain = (Read-Host "¿Deseas cambiar contraseña a otro usuario?: S / N ") -eq 'S' 
    # Recursividad
    if( $isTryAgain ) { changePasswordUser }
    
    return main
}
# funcion para salir del programa
function closeApp() {
    Clear-Host
    Write-Host "Gracias por utilizar esta aplicacion :) "
    Pause
}
#menu Principal
function main() {
    # importaciones de dependencias
    Import-Module $moduleActive
    # limpieza en consola
    Clear-host
    do {
        Write-Host "**********************************"
        Write-Host "          Menu principal          "
        Write-Host "**********************************"
        Write-Host "  1. Desbloquear Usuario          "
        Write-Host "  2. Cambiar contrasenia de usuario"
        Write-Host "  3. Salir                        "
        Write-Host "**********************************"
        [int] $option = Read-Host "Seleccion una opcion: "
        # valida
        switch ( $option ) {
            1 {  unlockUser break }
            2 {  changePasswordUser break  }
            3 { closeApp }
            Default { "Opcion no encontrada, seleccione una valida"  }
        }

    } while ( !$option -eq 3 );

}

# Ejecutar funcion principal
main
