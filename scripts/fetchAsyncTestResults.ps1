# fetchAsyncTestResults.ps1

if (Test-Path "test-result/test-run-id.txt") {
    $testRunId = (Get-Content "test-result/test-run-id.txt" -Raw).Trim()
    
    Write-Host "📥 Fetching results for async test run: $testRunId"

    # ✅ Validate test run ID length
    if ($testRunId.Length -ne 15 -and $testRunId.Length -ne 18) {
        Write-Host "❌ Invalid testRunId length: $testRunId"
        exit 1
    }

    # ✅ Fetch test results (fixed: removed --wait)
     sf apex get test --test-run-id $testRunId `
         --output-dir test-result `
         --result-format human

} else {
    Write-Host "❌ No test-run-id.txt found. Cannot fetch test results."
    exit 0
}
