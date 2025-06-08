$files = Get-ChildItem -Recurse -File | Where-Object { $_.Extension -match '\.(html|css|js|php|txt|xml|tpl)$' }

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Encoding Default
    $utf8NoBOM = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBOM)
    Write-Host "Converted $($file.FullName) to UTF-8"
} 