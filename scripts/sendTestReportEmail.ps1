$emailTo = $env:COMMIT_AUTHOR_EMAIL
if (-not $emailTo) {
    Write-Host "No author email found."
    exit 0
}

$subject = "Salesforce Apex Test Report"
$body = Get-Content test-results/test-result.txt -Raw

Send-MailMessage -To $emailTo `
                 -From $env:USERNAME `
                 -Subject $subject `
                 -Body $body `
                 -SmtpServer "smtp.yourserver.com" `
                 -Credential (New-Object PSCredential($env:USERNAME, (ConvertTo-SecureString $env:PASSWORD -AsPlainText -Force))) `
                 -Port 587 `
                 -UseSsl

