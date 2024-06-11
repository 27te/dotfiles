# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

Import-Module posh-git
$omp_config = Join-Path $PSScriptRoot ".\new.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression

# fnm call
fnm env --use-on-cd | Out-String | Invoke-Expression

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$laragon="C:\Users\leand\scoop\apps\laragon\6.0.0\laragon.exe"

# Github Cli
Invoke-Expression -Command $(gh completion -s powershell | Out-String)

# Fzf style and preview with bat
$env:FZF_DEFAULT_OPTS="
--color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
--color=label:#1df7ae,query:#1df7ae
--ansi --prompt=' ' --marker='→' --pointer='👉' --height=50% --layout='reverse-list' --info='right' --border='rounded' --border-label='fzf' --border-label-pos='2' --preview-window='border-rounded' --color=bg+:6,bg+:-1,border:6,hl:6,fg:15 --preview='bat --style='numbers,changes,header' --color=always --paging=always {}' --preview-window=right:60%"
$env:BAT_THEME = "ansi"

# Alias
Set-Alias laragon $laragon
Set-Alias g git
Set-Alias vim nvim
Set-Alias p python
Set-Alias c clear
Set-Alias l ls
Set-Alias pmd glow
Set-Alias -Name touch -Value New-Item 
Set-Alias mk mkdir
Set-Alias rn rni
Set-Alias py python
Set-Alias grep findstr
Set-Alias top btm
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'


function la {
    param (
        [string]$Path = "."
    )

    Get-ChildItem -Path $Path -Force
}

function ll {
 return  eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions
}

function listree{
	param($file);
	eza --tree --icons=always $file;
}
Set-Alias -Name "lt" -Value "listree";

# functions development
function vite {
  return npm create vite@latest
}

function astro {
  return npm create astro@latest
}

function basic-astro{
  return mkdir components,layouts,styles
}

function format {
  return npm i --save-dev prettier-plugin-astro prettier
}

function work {
  return cd "C:/Users/leand/scoop/apps/laragon/6.0.0/www/"
}

function run {
    return python -m http.server 5000
}

function inicio {
  return Bienvenido-ASCII
}


# Other functions
function Bienvenido-ASCII{
  Get-Content "C:/Users/leand/.config/powerShell/inicio.txt"
}


function New-Folder-Navigate-To-It {
  param($newFolderName);

  New-Item $newFolderName -ItemType directory;
  Set-Location -Path $newFolderName;
};
Set-Alias -Name "mkcd" -Value "New-Folder-Navigate-To-It";

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

inicio

