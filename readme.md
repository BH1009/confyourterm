# Configurar la Terminal

1. **Instalar PowerShell 7**
   - Descarga e instala PowerShell 7 desde la [Microsoft Store](https://apps.microsoft.com/detail/9mz1snwt0n5d?hl=en-au&gl=MX).

2. **Instalar Oh My Posh**
   - Ejecuta el siguiente comando para instalar Oh My Posh:
     ```powershell
     winget install JanDeDobbeleer.OhMyPosh -s winget
     ```

3. **Instalar la Fuente**
   - Ejecuta la terminal como administrador para descargar la fuente NerdFont que prefieras con el siguiente comando:
     ```powershell
     oh-my-posh font install
     ```

4. **Cambiar la Fuente Predeterminada**
   - Configura la fuente NerdFont que instalaste en la configuración de tu terminal. Esto generalmente se hace desde las opciones de configuración de la terminal que estés usando.

5. **Activar Oh My Posh**
   - Utiliza el siguiente comando para activar Oh My Posh:
     ```powershell
     oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
     ```
   - Luego, copia y pega el comando que se muestra como respuesta. Por ejemplo:
     ```powershell
     (@(& 'C:/Users/$env:USERNAME/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='$poshConfigPath' --print) -join "`n") | Invoke-Expression
     ```

6. **Configurar el Archivo `$PROFILE`**
   - Ejecuta los siguientes comandos para crear y abrir el archivo de perfil de PowerShell:
     ```powershell
     New-Item -Path $PROFILE -Type file -Force
     notepad $PROFILE
     ```
   - Pega el comando de activación de Oh My Posh que copiaste anteriormente en el archivo `$PROFILE`.

7. **Instalar los Iconos de la Terminal**
   - Ejecuta el siguiente comando para instalar el módulo Terminal-Icons:
     ```powershell
     Install-Module -Name Terminal-Icons -Repository PSGallery -Force
     ```
   - Luego, agrega la siguiente línea al archivo `$PROFILE` para importar el módulo Terminal-Icons:
     ```powershell
     Import-Module Terminal-Icons
     ```

8. **Agregar Autocompletado**
   - Ejecuta el siguiente comando para habilitar la vista de autocompletado en lista:
     ```powershell
     Set-PSReadLineOption -PredictionViewStyle ListView
     ```

Una vez que completes estos pasos, reinicia PowerShell para aplicar todos los cambios. ¡Tu terminal debería estar lista con Oh My Posh y los iconos de la terminal configurados!
