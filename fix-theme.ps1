Get-ChildItem -Path ".\themes" -Filter "*.html" -Recurse | ForEach-Object {
    $content = Get-Content $_.FullName -Raw -Encoding UTF8
    
    if ($content -match '\.Site\.IsMultiLingual') {
        $content = $content -replace '\.Site\.IsMultiLingual', 'hugo.IsMultilingual'
        Set-Content -Path $_.FullName -Value $content -Encoding UTF8
        Write-Host "Fixed: $($_.FullName)" -ForegroundColor Green
    }
}

Write-Host "`nDone!" -ForegroundColor Cyan