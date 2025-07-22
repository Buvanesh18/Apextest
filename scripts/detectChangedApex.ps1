$changedFiles = git diff --name-only origin/main...HEAD

$apexClassesChanged = @()
foreach ($file in $changedFiles) {
    if ($file -like "force-app/main/default/classes/*.cls") {
        $className = [System.IO.Path]::GetFileNameWithoutExtension($file)
        $apexClassesChanged += $className
    }
}

if ($apexClassesChanged.Count -eq 0) {
    Write-Host "No Apex classes changed."
    echo "APEX_CHANGED=false" >> $env:GITHUB_ENV
    exit 0
}

$apexList = $apexClassesChanged -join ","
echo "CHANGED_CLASSES=$apexList" >> $env:GITHUB_ENV
echo "APEX_CHANGED=true" >> $env:GITHUB_ENV
