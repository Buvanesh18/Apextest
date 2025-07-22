# Get GitHub Token and Repository Info
$pat = $env:GIT_TOKEN
$repo = $env:GITHUB_REPOSITORY
$commitID = $env:GITHUB_SHA

# GitHub API headers
$header = @{
    Authorization = "Bearer $pat"
    "User-Agent" = "PowerShell"
}

# Get commit info
$mergeCommitsUrl = "https://api.github.com/repos/$repo/commits/$commitID"
Write-Host "Fetching commit info from $mergeCommitsUrl"

try {
    $mergeCommitsResponse = Invoke-RestMethod -Uri $mergeCommitsUrl -Headers $header -Method Get
} catch {
    Write-Error "Failed to fetch commit info: $_"
    exit 1
}

$commitAuthorName = $mergeCommitsResponse.author.login
Write-Host "Commit Author Name: $commitAuthorName"

# Get recent commits by that author
$commitUrl = "https://api.github.com/repos/$repo/commits?author=$commitAuthorName&per_page=100"
try {
    $commitResponse = Invoke-RestMethod -Uri $commitUrl -Headers $header -Method Get
} catch {
    Write-Error "Failed to fetch commits by author: $_"
    exit 1
}

$email = ""
foreach ($commit in $commitResponse) {
    $authorEmail = $commit.commit.author.email
    if (!$authorEmail.Contains("noreply")) {
        $email = $authorEmail
        break
    }
}

if ([string]::IsNullOrEmpty($email)) {
    $email = "buvaneshmvp007@gmail.com"
}

Write-Host "Author Email: $email"
"gitAuthorEmail=$email" | Out-File -Append -FilePath $env:GITHUB_ENV
