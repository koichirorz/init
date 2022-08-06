# chocolatey

## Install command
```
Power Shell > Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

## Batch installation
```
cinst -y choco.config
```

# ChgKey

## Clinent側のPCのみ設定

- chgkey.iniはcapslockキーをF13に設定

# autohotkey

`autohotkey.ahk.exe`はahkファイルから生成したもの。

# startupに配置
エクスプローラーで`shell:startup`を開いて以下を配置
- autohotokey.ahk.exe
- clibor/Clibor.exeのショートカット
- Docker Desktopのショートカット(choco.comfigでインストール)


# Docker Desktop
`WSL 2 installation is incomplete.` エラーが発生した場合は以下で対応する。
- https://takabus.com/tips/326/