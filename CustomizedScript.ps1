function InstallAzModule{
    param(
        [string] $moduleName,
        [string] $scope
    
    )
    if(Get-Module -ListAvailable -Name $moduleName)
    {
        Import -Module $moduleName
     }
     else{
            Install-Module $moduleName -Scope $scope -Force
            Import-Module $moduleName
     }
   }

   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser


    InstallAzModule -moduleName "Az" -scope "CurrentUser" -Repository PSGallery -Force

function InstallGoogleChrome {

          md -Path $env:temp\chromeinstall -erroraction SilentlyContinue | Out-Null
        $Download = join-path $env:temp\chromeinstall chrome_installer.exe
          Invoke-WebRequest 'http://dl.google.com/chrome/install/375.126/chrome_installer.exe'  -OutFile $Download
           Invoke-Expression "$Download /silent /install"

}

function InstallEdge {

      md -Path $env:temp\edgeinstall -erroraction SilentlyContinue | Out-Null
    $Download = join-path $env:temp\edgeinstall MicrosoftEdgeEnterpriseX64.msi
    Invoke-WebRequest 'https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/a2662b5b-97d0-4312-8946-598355851b3b/MicrosoftEdgeEnterpriseX64.msi'  -OutFile $Download
    Start-Process "$Download" -ArgumentList "/quiet"
    

}
Install-AzModule
Install-GoogleChrome
Install-Edge
