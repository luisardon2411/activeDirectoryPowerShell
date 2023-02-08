# Gestion de usuarios de Active Directory  a través de PowerShell😁🤖

## Metodo de instalacion 🧑‍💻
- `¿Como descargargo el contenido?`
1. Ubicarse en el boton de  **<>Code**  que aparece al inicio del repositorio
2. Luego en Download zip

- `Quitar restriccion al ejecutar scripts en PowerShell`: 
1. Ejecutar como administrador PowerShell
```powershell 
PS C:\Windows\system32 \> 
```
2.  Para establecer la directiva de ejecución en un ámbito determinado:
```powershell 
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser 
```

## Modo de uso ⚠️
**Como iniciar el script:** 
- Descomprimir el archivo **activeDirectoryPowerShell-main.zip** 
- Guardar la carpeta **activeDirectoryPowerShell** en cualquier ubicacion. **( De preferencia en la unidad C: )**
- Abrir PowerShell y ubicarse en la carpeta donde se guardo el archivo AD.ps1
**( Como ejemplo se tomara la ubicación en la unidad C: )**
```powershell 
PS C:\activeDirectoryPowerShell\>
```
- Ejecutar lo siguiente presionando la tecla *Enter*
```powershell
PS C:\activeDirectoryPowerShell\> .\AD.ps1
```
#### Nota adicional: ⚠️
- Si aun no se han realizado los pasos indicados en metodo de instalacion, No se podrá ejecutar correctamente el script. Esto debido a una directiva de ejecución
  de script de PowerShell
# Menus 💻
### Menu Principal 🖥️
### Atención 👀 
- Las unicas entradas validas en todos los menus son números. Esto para no provocar fallos al momento de ejecucion en el script
```powershell
  "**********************************"
  "          Menu principal          "
  "**********************************"
  "  1. Desbloquear Usuario          "
  "  2. Cambiar contrasenia de usuario"
  "  3. Salir                        "
  "**********************************"
  "Selecione una opcion:"
```
### Menu de desbloqueo de usuario

```powershell
    "*****************************"
    "    Desbloqueo de usuario    "
    "*****************************"
    "Usuario: pancracio.perez     "
    "Dominio: GT                  "
    "*****************************"
```
### Menu de cambio de contraseña de usuario

```powershell
    "*****************************"
    "Cambio de contraseña de usuario"
    "*****************************"
    "Usuario: pancracio.perez     "
    "Contrasenia: *************   "
    "Dominio: GT                  "
    "*****************************"
```

#### Nota importante: ⚠️
Los dominios validos son los siguientes, tanto en mayuscula como en minuscula:
- GT
- SV
- HN
- NI
- CR
- PA
##### *De no cumplir lo anterior el dominio sera invalido.*
##### *❗Esto aplica tanto como desbloqueo y cambio. ❗*

### Nota: ⚠️
- **Esta aplicacion funciona unicamente para usuarios que posean los permisos necesarios para realizar dichos cambios en el controlador de Active Directory**

# Funcionales de la aplicacion 🔨
- `Desbloqueo de usuario`: Permite realizar desbloqueo de los usuario en el controlador de Active Directory
- `Cambio de contraseña de usuario`:  Funcionalidad para cambiar contraseña en el controlador de Active Directory


### Licencia
- MIT
