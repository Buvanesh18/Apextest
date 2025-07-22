# detectChangedApex.ps1

$changedFiles = Get-ChildItem -Recurse -Path "delta/force-app/main/default/classes" -Filter *.cls

$changedApex = $changedFiles | Where-Object { $_.Name -notlike "*Test.cls" }

if ($changedApex.Count -gt 0) {
    Write-Host "✅ Apex class changes detected."
    $changedApex | ForEach-Object { Write-Host $_.Name }
    echo "HAS_APEX_CHANGES=true" >> $env:GITHUB_ENV
} else {
    Write-Host "❌ No Apex classes changed."
    echo "HAS_APEX_CHANGES=false" >> $env:GITHUB_ENV
}

