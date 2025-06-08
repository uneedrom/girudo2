$files = Get-ChildItem -Recurse -File | Where-Object { $_.Extension -match '\.(html|css|js|txt)$' }

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding Default
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
    Write-Host "Converted $($file.FullName)"
} 