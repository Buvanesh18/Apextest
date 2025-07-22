# runRelatedTests.ps1

if ($env:HAS_APEX_CHANGES -eq "true") {
    $classFiles = Get-ChildItem -Recurse -Path "delta/src/classes" -Filter "*.cls" | Where-Object { $_.Name -notlike "*Test.cls" }
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
        sf apex run test --tests "$($testClassNames -join ',')" --output-dir test-result --result-format human --wait 10 --async
    } else {
        Write-Host "⚠️ No related test classes found."
    }
} else {
    Write-Host "✅ No Apex class changes detected. Skipping test execution."
}



