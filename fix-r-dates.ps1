Get-ChildItem -Path ".\content" -Filter "*.md" -Recurse | ForEach-Object {
    $content = Get-Content $_.FullName -Raw -Encoding UTF8
    
    # Thay thế date có code R thành date chuẩn
    $content = $content -replace 'date\s*:\s*"`r.*?`"', 'date: "2024-01-15"'
    
    Set-Content -Path $_.FullName -Value $content -Encoding UTF8
    Write-Host "Fixed: $($_.Name)" -ForegroundColor Green
}

Write-Host "`nDone!" -ForegroundColor Cyan