Set-Location (Split-Path $MyInvocation.MyCommand.Path -Parent)

try {
    # 使用新的下载链接
    Invoke-WebRequest `
        -Uri 'https://github.com/XTLS/Xray-core/releases/download/v24.12.31/Xray-windows-64.zip' `
        -OutFile 'Xray-windows-64.zip'
    
    # 解压缩文件
    Expand-Archive -Force -Path Xray-windows-64.zip -DestinationPath Xray-core
}
catch {
    Write-Host "下载或解压缩过程中发生错误: $_"
    exit 1
}

# 移动文件到 release 目录
mv -Force 'Xray-core\Xray.exe' '..\release\Xray.exe'

exit 0
