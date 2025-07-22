if ($env:APEX_CHANGED -ne "true") {
    Write-Host "✅ No Apex class changes detected. Skipping test execution."
    exit 0
}

$testClasses = @()

foreach ($class in $env:CHANGED_CLASSES -split ",") {
    $testPath = "force-app/test/default/classes/${class}Test.cls"
    if (Test-Path $testPath) {
        $testClassName = "${class}Test"
        Write-Host "✅ Found test class: $testClassName"
        $testClasses += $testClassName
    } else {
        Write-Host "⚠️ No test class found for: $class"
    }
}

if ($testClasses.Count -eq 0) {
    Write-Host "❌ No related test classes found. Skipping test run."
    exit 0
}

$testList = $testClasses -join ","
Write-Host "`n🚀 Running Apex Tests: $testList`n"

if (-not (Test-Path "test-results")) {
    New-Item -ItemType Directory -Path "test-results" | Out-Null
}

sf apex run test `
    --tests $testList `
    --result-format human `
    --output-dir test-results `
    --async `
    --wait 10

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Test execution failed."
    exit 1
}

Write-Host "✅ Tests triggered successfully. Async job started."


