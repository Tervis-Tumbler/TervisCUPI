#Requires -Modules CUPIPowerShell

function Install-TervisCUPI {
    Set-CUPIRootAPIURL -RootAPIURL "https://ter-cuc-pub1/vmrest"
    New-TervisCUCCredential
}

Function Invoke-TervisCUCTerminateVM {
    param (
          $Alias
    )

    $CUPIUser = Find-CUPIUserByAlias -Alias $Alias -ErrorAction SilentlyContinue
    if ($CUPIUser) {
        $RemoveCUPIUserResult = $CUPIUser |  Remove-CUPIUser
        $RemoveCUPIUserResult
    }
}

function New-TervisCUCCredential {    
    New-CUCCredential -CUCCredential $(Get-PasswordstateCredential -PasswordID 15)
}