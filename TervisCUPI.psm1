#Requires -Modules CUPIPowerShell

Function Invoke-TervisCUCTerminateVM {
    param (
          $Alias
    )

    $CUPIUser = Find-CUPIUserByAlias -Alias $Alias 
    $RemoveCUPIUserResult = $CUPIUser |  Remove-CUPIUser

    #$RemoveCUPIUserResult = Find-CUPIUserByAlias -Alias test |
    #Remove-CUPIUser
}

function New-TervisCUCCredential {
    $CUCCredentialFromPasswordState = Get-PasswordstateCredential -PasswordstateListAPIKey (Get-PasswordStateAPIKey) -PasswordID 15
    $CUCUsername = $CUCCredentialFromPasswordState.UserName
    $CUCPassword = $CUCCredentialFromPasswordState.Password
    $CUCCredentialObject = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $CUCUsername, $CUCPassword
    
    New-CUCCredential -CUCCredential $CUCCredentialObject

}