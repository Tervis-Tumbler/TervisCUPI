Function Invoke-TervisCUCTerminateVM {
    param (
          $Alias
    )

    $CUPIUser = Find-CUPIUserByAlias -Alias $Alias 
    $RemoveCUPIUserResult = $CUPIUser |  Remove-CUPIUser

    #$RemoveCUPIUserResult = Find-CUPIUserByAlias -Alias test |
    #Remove-CUPIUser
}
