# Set paths
$projectRoot = "D:\web\Angular\portfolio-dashboard"
$deployPath = "D:\web\Angular\deploy"
$buildOutput = "$projectRoot\dist\portfolio-dashboard\browser"

# Move to project root
Set-Location $projectRoot

# Build the project
ng build --configuration production

# Ensure build succeeded
if (!(Test-Path $buildOutput)) {
    Write-Host "Build failed or output path not found: $buildOutput"
    exit 1
}

# Remove old deploy files except .git (if present)
Get-ChildItem -Path $deployPath -Force | Where-Object { $_.Name -ne ".git" } | Remove-Item -Recurse -Force

# Copy new build output to deploy path
Copy-Item -Path $buildOutput\* -Destination $deployPath -Recurse

Write-Host "Deploy folder updated with latest build."

# Create 404.html with the same content as index.html in deploy folder
$indexFile = Join-Path $deployPath "index.html"
$notFoundFile = Join-Path $deployPath "404.html"
if (Test-Path $indexFile) {
    Copy-Item -Path $indexFile -Destination $notFoundFile -Force
    Write-Host "404.html created from index.html."
} else {
    Write-Host "index.html not found in deploy folder. 404.html not created."
}

# Prompt for commit message
$commitMessage = Read-Host "Enter commit message for deploy folder"

# Commit and push changes in deploy folder
Set-Location $deployPath

git add .
git commit -m "$commitMessage"
git push

Write-Host "Deploy folder changes committed and pushed."
