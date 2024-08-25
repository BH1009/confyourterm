# Configure the Terminal

1. **Install PowerShell 7**
   - Download and install PowerShell 7 from the [Microsoft Store](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK6N6).

2. **Install Oh My Posh**
   - Run the following command to install Oh My Posh:
     ```powershell
     winget install JanDeDobbeleer.OhMyPosh -s winget
     ```

3. **Install the Font**
   - Run the terminal as an administrator to download the NerdFont of your choice using the following command:
     ```powershell
     oh-my-posh font install
     ```

4. **Change the Default Font**
   - Configure the NerdFont you installed in your terminal's settings. This is typically done through the terminal's configuration options.

5. **Activate Oh My Posh**
   - Use the following command to activate Oh My Posh:
     ```powershell
     oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json" | Invoke-Expression
     ```
   - Then, copy and paste the command that appears in the response. For example:
     ```powershell
     (@(& 'C:/Users/$env:USERNAME/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='$poshConfigPath' --print) -join "`n") | Invoke-Expression
     ```

6. **Configure the `$PROFILE` File**
   - Run the following commands to create and open the PowerShell profile file:
     ```powershell
     New-Item -Path $PROFILE -Type file -Force
     notepad $PROFILE
     ```
   - Paste the Oh My Posh activation command you copied earlier into the `$PROFILE` file.

7. **Install Terminal Icons**
   - Run the following command to install the Terminal-Icons module:
     ```powershell
     Install-Module -Name Terminal-Icons -Repository PSGallery -Force
     ```
   - Then, add the following line to the `$PROFILE` file to import the Terminal-Icons module:
     ```powershell
     Import-Module Terminal-Icons
     ```

8. **Add Autocomplete**
   - Run the following command to enable the list view for autocomplete:
     ```powershell
     Set-PSReadLineOption -PredictionViewStyle ListView
     ```

Once you have completed these steps, restart PowerShell to apply all changes. Your terminal should now be set up with Oh My Posh and terminal icons configured!
