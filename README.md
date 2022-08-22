# wgcf-plus ![GitHub all releases](https://img.shields.io/github/downloads/naruto522ru/wgcf-plus/total) [![build](https://github.com/naruto522ru/wgcf-plus/actions/workflows/test.yml/badge.svg)](https://github.com/naruto522ru/wgcf-plus/actions/workflows/test.yml)

![](https://github.com/naruto522ru/wgcf-plus/raw/main/Preview/Preview-GH.gif)

### Description:
#### This repository is designed to generate Warp+ configs for WireGuard on almost all available devices except Android ([Termux](https://play.google.com/store/apps/details?id=com.termux&hl=us&gl=US)) and iOS ([iSH Shell](https://apps.apple.com/us/app/ish-shell/id1436902243)).
---
#### Contacting the author: [Email](mailto:itachi522ru@gmail.com),[Telegram](https://t.me/FallOutB0y) 

| Release        | Arch |       Support  | Interpreter | Tested Author
| :---------- | :------------: | :------------: | :------------ | :------------
| Linux-32bit |32bit\64bit| &#9989;| Bash | &#9989;
| Linux-ARMv7| ARMv7\ARMv8| &#9989;| Bash | &#9989;
| MacOS-64bit| 64bit| &#9989;| Bash | &#9989; (Catalina)
| MacOS-ARMv8| ARMv8| &#9989;| Bash | &#9989;
| Termux-ARMv7| ARMv7\ARMv8| &#9989;| Bash | &#9989;
| Termux-32bit| 32bit\64bit | &#9989;| Bash | &#10006;
| Windows-32bit| 32bit\64bit| &#9989;| PowerShell| &#9989;
| Windows-ARMv7| ARMv7| &#9989;| PowerShell | &#10006;
| WSL |64bit| &#9989;| Bash | &#9989;
| iSH Shell|ARM| &#10006; |Bash| &#10006;

## Contents
- [Requirements](#requirements)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [Thanks](#thanks)
---

## Requirements:
### Linux\MacOS\Termux\WSL (Windows only 64-bit)\iSH Shell:
##### Bash 4 or 5 version
### Windows 7-11 (32-bit,ARMv7):
##### PowerShell 7 or newer

## Requirements for build (no in docker):
WSL\MacOS\Linux:

- [Android NDK](https://developer.android.com/ndk/downloads) (building for termux need r24 version)
- [Go](https://go.dev/dl/)
- Git
- zip (Optional dependency for create release)

**Commentary:** All software to be installed must be installed in $PATH.Android NDK locate in /opt and specify the path to it in the PATH ``/opt/android-ndk-r24``.

## Usage:
Download the release you want or clone this repository. Go to the folder.
#### Linux\MacOS\Termux\WSL (Windows)\iSH Shell
In terminal:
```
chmod +x ./warp_config_generator.sh && ./warp_config_generator.sh
```
#### Windows 7-11 (32-bit,ARMv7)
In PowerShell:
```
.\warp_config_generator.ps1
```
##  Troubleshooting:
If it doesn't work try replacing EndPoints with the following:
```
162.159.193.1 
162.159.193.2
162.159.193.3
162.159.193.4
162.159.193.5
162.159.193.6
162.159.193.7
162.159.193.8
162.159.193.9
```
Possible **UDP port** values: **2408**,**500**,**1701**,**4500**
## Thanks:

• [Friend](https://github.com/Innsmouth-trip) (It was he who did the bulk of the work of porting the script to the new language. The binary is named after him by his nickname.)

• Saito.Alex (Author of the python script)

• f129 (Author of the powershell script)

• And the project [wgcf](https://github.com/ViRb3/wgcf) for the program itself
