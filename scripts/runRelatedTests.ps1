# runRelatedTests.ps1

if ($env:HAS_APEX_CHANGES -eq "true") {
    $classFiles = Get-ChildItem -Recurse -Path "delta/force-app/main/default/classes" -Filter "*.cls" | Where-Object { $_.Name -notlike "*Test.cls" }
    $testClassNames = @()

    foreach ($file in $classFiles) {
        $baseName = $file.BaseName
        $testPattern = "$baseName" + "Test.cls"
        $testFilePath = "force-app/test/default/classes/$testPattern"
        if (Test-Path $testFilePath) {
            $testClassNames += $baseName + "Test"
        }
    }

    if ($testClassNames.Count -gt 0) {
        Write-Host "▶️ Running tests: $($testClassNames -join ', ')"
        sfdx force:apex:test:run --tests "$($testClassNames -join ',')" --resultformat human --outputdir test-result --wait 10 --testlevel RunSpecifiedTests  
    } else {
        Write-Host "⚠️ No related test classes found."
    }
} else {
    Write-Host "✅ No Apex class changes detected. Skipping test execution."
}




