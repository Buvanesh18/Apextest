$deltaPath = "delta/force-app/main/default/classes"

if (-Not (Test-Path $deltaPath)) {
    Write-Host "No Apex classes found in delta. Skipping test detection."
    "HAS_APEX_CHANGES=false" | Out-File -Append -FilePath $env:GITHUB_ENV
    exit 0
}

$changedFiles = Get-ChildItem -Recurse -Path $deltaPath -Filter *.cls
if ($changedFiles.Count -eq 0) {
    Write-Host "No Apex class changes detected."
    "HAS_APEX_CHANGES=false" | Out-File -Append -FilePath $env:GITHUB_ENV
} else {
    Write-Host "Detected changed Apex classes:"
    $changedFiles.FullName | ForEach-Object { Write-Host $_ }

    # Set environment variable to true
    "HAS_APEX_CHANGES=true" | Out-File -Append -FilePath $env:GITHUB_ENV

    # Save changed Apex class names to a file for test mapping
    $changedFiles | ForEach-Object {
        $_.BaseName
    } | Set-Content -Path changed_classes.txt
}

