# fetchAsyncTestResults.ps1

if (Test-Path "test-result/test-run-id.txt") {
    $testRunId = Get-Content "test-result/test-run-id.txt" -Raw
    Write-Host "📥 Fetching results for async test run: $testRunId"

    sfdx force:apex:test:report `
        --testrunid $testRunId `
        --outputdir test-result `
        --resultformat human `
        --wait 10
} else {
    Write-Host "❌ No test-run-id.txt found. Cannot fetch test results."
    exit 1
}
