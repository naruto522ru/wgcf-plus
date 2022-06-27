Write-Host "================ Generate Warp+ license key? ================" -ForegroundColor Green
Write-Host "`tEnter 1, will be generate new Warp+ license key." -ForegroundColor Green
Write-Host "`tPress Enter without entry to skip generate." -ForegroundColor Green
Write-Host "=============================================================" -ForegroundColor Green
$genwarpplus = Read-Host "`nEnter 1 to generate or press Enter to skip"
switch ($genwarpplus) {
		   '1'{
				 Write-Host "`nGenerate new Warp+ license key, please wait..." -ForegroundColor Green
				.\invisibles-crack.exe
				Write-Host "=============================================================" -ForegroundColor Green
				Write-Host "`tNew Warp+ license key above this line," -ForegroundColor Green
				Write-Host "`tcopy it and paste below" -ForegroundColor Green
		   }

		   ''{
				 Write-Host "`nSkip generate Warp+ key" -ForegroundColor Green
				 
		   }
		}
Write-Host "=============================================================" -ForegroundColor Green
$warpkey = Read-Host "Paste Warp+ license key or leave blank if you want to use new Warp"
$warpkey = $warpkey -replace '\s',''
If ( $warpkey -eq "" -or $warpkey.length -ne 26)
{
	Write-Host "Empty or incorrect Warp+ key, trying use new Warp with random filenames" -ForegroundColor Blue
	$random = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
	Write-Host "`nRegister and create new Warp account..." -ForegroundColor Blue
	.\wgcf.exe register --accept-tos --config ($random + "_Warp.toml")
	Write-Host "`nGenerate Warp config profile for WireGuard..." -ForegroundColor Blue
	.\wgcf.exe generate -p ($random + "_Warp.conf") --config ($random + "_Warp.toml")
	$FILE = Get-Content -Path ($random + "_Warp.conf")
	$NEWFILE = $FILE -replace 'engage.cloudflareclient.com:2408', '162.159.193.5:2408'
	$NEWFILE | Set-Content -Path ($random + "_Warp.conf")
	Write-Host "`nDone" -ForegroundColor Blue
}
Else 
{
	Write-Host "Trying use Warp+ license key:" $warpkey -ForegroundColor Blue
	$env:WGCF_LICENSE_KEY = $warpkey
		Write-Host "========== Select output filenames length ===========" -ForegroundColor Green
		Write-Host ("`t1. Full name include Warp key e.g. " + $warpkey + "_Warp+.conf") -ForegroundColor Green
		Write-Host ("`t2. Short name include partial Warp key e.g. " + $warpkey.substring(0, 8) + "_Warp+.conf") -ForegroundColor Green
		Write-Host "=====================================================" -ForegroundColor Green
		$choice = Read-Host "`nEnter choice or press Enter to select 1"

		switch ($choice) {
		   '1'{
				 Write-Host "`nSelected full filenames" -ForegroundColor Green
				 $filename = $warpkey
		   }
		   '2'{
				 Write-Host "`nSelected short filenames" -ForegroundColor Green
				 $filename = $warpkey.substring(0, 8)
		   }
		   ''{
				 Write-Host "`nDefault selected full filenames" -ForegroundColor Green
				 $filename = $warpkey
		   }
		}
	Write-Host "`nRegister and create new Warp account..." -ForegroundColor Blue
	.\wgcf.exe register --accept-tos --config ($filename + "_Warp+.toml")
	Write-Host "`nUpdate Warp+ on new license key..." -ForegroundColor Blue
	.\wgcf.exe update --config ($filename + "_Warp+.toml")
	Write-Host "`nGenerate Warp+ config profile for WireGuard..." -ForegroundColor Blue
	.\wgcf.exe generate -p ($filename + "_Warp+.conf") --config ($filename + "_Warp+.toml")
	$FILE = Get-Content -Path ($filename + "_Warp+.conf")
	$NEWFILE = $FILE -replace 'engage.cloudflareclient.com:2408', '162.159.193.5:2408'
	$NEWFILE | Set-Content -Path ($filename + "_Warp+.conf")
	$env:WGCF_LICENSE_KEY = ''
	Write-Host "`nDone" -ForegroundColor Blue
}
