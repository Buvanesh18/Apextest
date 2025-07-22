# Check if there are any Apex class changes
if ($env:APEX_CHANGED -ne "true") {
    Write-Host "✅ No Apex class changes detected. Skipping test execution."
    exit 0
}

# Initialize an empty array to hold related test class names
$testClasses = @()

# Loop through each changed class
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

# If no test classes were found, skip the test run
if ($testClasses.Count -eq 0) {
    Write-Host "❌ No related test classes found. Skipping test run."
    exit 0
}

# Join test class names into a comma-separated string
$testList = $testClasses -join ","
Write-Host "`n🚀 Running Apex Tests: $testList`n"

# Create output directory if not exists
if (-not (Test-Path "test-results")) {
    New-Item -ItemType Directory -Path "test-results" | Out-Null
}

# Run tests using Salesforce CLI and handle errors properly
$runResult = sf apex run test `
    --tests $testList `
    --result-format human `
    --output-dir test-results `
    --async `
    --wait 10

# Check the command result
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Test execution failed."
    exit 1
}

Write-Host "✅ Tests triggered successfully. Async job started."

