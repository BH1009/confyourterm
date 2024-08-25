Write-Host 'Hello, World!'
$input = Read-Host  'What is your name ? '
Write-Host "Nice to meet you $input, we are ready to star!"

# Verificar si PowerShell está instalado
function Check-PowerShell {
    $psVersion = $PSVersionTable.PSVersion
    if ($psVersion -lt [Version]"7.0") {
        Write-Host "PowerShell 7 o superior no está instalado. Instalando..."
        # Instrucciones para instalar PowerShell (esto puede variar dependiendo del sistema)
        # Aquí solo se muestra el enlace a la descarga
        Start-Process "https://github.com/PowerShell/PowerShell/releases" -NoNewWindow
        exit
    }
}

# Instalar Oh My Posh
function Install-OhMyPosh {
    Write-Host "Instalando Oh My Posh..."
    winget install JanDeDobbeleer.OhMyPosh -s winget
}

# Instalar fuente Oh My Posh
function Install-PoshFont {
    Write-Host "Instalando la fuente Oh My Posh..."
    oh-my-posh font install
}

# Configurar Oh My Posh
function Configure-OhMyPosh {
    Write-Host "Configurando Oh My Posh..."
    $poshConfigPath = "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"
    $initCommand = "oh-my-posh init pwsh --config `"$poshConfigPath`" | Invoke-Expression"
    $initResult = & $initCommand
    Write-Host "Copia el siguiente comando y ejecútalo en la terminal para finalizar la configuración:"
    Write-Host "(@(& 'C:/Users/$env:USERNAME/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='$poshConfigPath' --print) -join \"`n\") | Invoke-Expression"
}

# Configurar el perfil de PowerShell
function Configure-Profile {
    Write-Host "Configurando el perfil de PowerShell..."
    $profilePath = $PROFILE
    if (-not (Test-Path $profilePath)) {
        New-Item -Path $profilePath -Type file -Force
    }
    $profileContent = @"
# Configuración de Oh My Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression

# Importar Terminal Icons
Import-Module Terminal-Icons
"@
    Add-Content -Path $profilePath -Value $profileContent
}

# Instalar Terminal Icons
function Install-TerminalIcons {
    Write-Host "Instalando Terminal Icons..."
    Install-Module -Name Terminal-Icons -Repository PSGallery -Force
}

# Configurar autocompletado
function Configure-Autocomplete {
    Write-Host "Configurando autocompletado..."
    Set-PSReadLineOption -PredictionViewStyle ListView
}

# Ejecutar funciones
Check-PowerShell
Install-OhMyPosh
Install-PoshFont
Configure-OhMyPosh
Configure-Profile
Install-TerminalIcons
Configure-Autocomplete

Write-Host "La configuración se ha completado. Por favor, reinicia PowerShell para aplicar todos los cambios."
