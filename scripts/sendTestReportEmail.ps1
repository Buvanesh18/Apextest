# scripts/sendTestReportEmail.ps1

$testReport = Get-Content "test-result/test-result.txt" -Raw
$authorEmail = $env:GIT_AUTHOR_EMAIL

if ($authorEmail) {
    Write-Host "📨 Sending email to $authorEmail using Gmail SMTP..."

    try {
        Send-MailMessage -From $env:USERNAME `
                         -To $authorEmail `
                         -Subject "✅ Apex Test Execution Report" `
                         -Body $testReport `
                         -SmtpServer "smtp.gmail.com" `
                         -Port 587 `
                         -UseSsl `
                         -Credential (New-Object System.Management.Automation.PSCredential(
                            $env:USERNAME,
                            (ConvertTo-SecureString $env:PASSWORD -AsPlainText -Force)
                         ))
        Write-Host "✅ Email sent successfully!"
    } catch {
        Write-Error "❌ Failed to send email: $_"
    }
} else {
    Write-Host "❌ No author email found. Skipping email report."
}


