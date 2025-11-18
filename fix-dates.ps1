# Fix tất cả file .md trong content/
Get-ChildItem -Path ".\content" -Filter "*.md" -Recurse | ForEach-Object {
    Write-Host "Processing: $($_.FullName)"
    
    $content = Get-Content $_.FullName -Raw -Encoding UTF8
    
    # Sửa date thành format chuẩn
    $content = $content -replace 'date:\s*.*', 'date: "2024-01-15"'
    
    Set-Content -Path $_.FullName -Value $content -Encoding UTF8
    
    Write-Host "Fixed: $($_.Name)" -ForegroundColor Green
}

Write-Host "`nDone! All dates fixed." -ForegroundColor Cyan