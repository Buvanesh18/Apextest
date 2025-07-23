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
        Write-Host "▶️ Triggering async test run for: $($testClassNames -join ', ')"

        # Trigger asynchronous test run and capture testRunId
        $testRunJson = sfdx force:apex:test:run `
            --tests "$($testClassNames -join ',')" `
            --testlevel RunSpecifiedTests `
            --outputdir test-result `
            --wait 0 `
            --json

        $parsed = $testRunJson | ConvertFrom-Json
        $testRunId = $parsed.result.testRunId

        if ($testRunId) {
            Write-Host "📌 Async TestRunId: $testRunId"
            Set-Content -Path "test-result/test-run-id.txt" -Value $testRunId
        } else {
            Write-Host "❌ Failed to get testRunId."
            exit 1
        }
    } else {
        Write-Host "⚠️ No related test classes found."
    }
} else {
    Write-Host "✅ No Apex class changes detected. Skipping test execution."
}




