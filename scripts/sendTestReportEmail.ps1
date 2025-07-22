# scripts/sendTestReportEmail.ps1

$testReport = Get-Content "test-result/test-result.txt" -Raw
$authorEmail = $env:GIT_AUTHOR_EMAIL

if ($authorEmail) {
    Write-Host "📨 Sending email to $authorEmail..."

    Send-MailMessage -From $env:USERNAME `
                     -To $authorEmail `
                     -Subject "✅ Apex Test Execution Report" `
                     -Body $testReport `
                     -SmtpServer "smtp.office365.com" `
                     -Port 587 `
                     -UseSsl `
                     -Credential (New-Object System.Management.Automation.PSCredential($env:USERNAME, (ConvertTo-SecureString $env:PASSWORD -AsPlainText -Force)))
} else {
    Write-Host "❌ No author email found. Skipping email report."
}


