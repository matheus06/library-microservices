param (
    [Parameter(Mandatory = $true)]
    [string]
    $RegistryName,
    [Parameter(Mandatory = $true)]
    [string]
    $Major,
    [Parameter(Mandatory = $true)]
    [string]
    $Minor,
    [Parameter(Mandatory = $true)]
    [string]
    $Patch
)
Begin {
    
}
Process {
    function Build-Docker-Images {
        param (
            [Parameter(Mandatory = $true)]
            [string]
            $Major,
            [Parameter(Mandatory = $true)]
            [string]
            $Minor,
            [Parameter(Mandatory = $true)]
            [string]
            $Patch
        )

        docker build  ../../Library.Books -t $RegistryName/library-books:$Major.$Minor.$Patch
        docker build  ../../Library.Hub -t $RegistryName/library-hub:$Major.$Minor.$Patch
        docker build  ../../Library.Shop -t $RegistryName/library-shop:$Major.$Minor.$Patch
        docker build  ../../Library.UI -t $RegistryName/library-ui:$Major.$Minor.$Patch
        docker build  ../../Library.Auth -t $RegistryName/library-auth:$Major.$Minor.$Patch
        Write-Output "build done"
    }

    function Push-Docker-Images {
        param (
            [Parameter(Mandatory = $true)]
            [string]
            $Major,
            [Parameter(Mandatory = $true)]
            [string]
            $Minor,
            [Parameter(Mandatory = $true)]
            [string]
            $Patch
        )

        docker push $RegistryName/library-books:$Major.$Minor.$Patch
        docker push $RegistryName/library-hub:$Major.$Minor.$Patch
        docker push $RegistryName/library-shop:$Major.$Minor.$Patch
        docker push $RegistryName/library-ui:$Major.$Minor.$Patch
        docker push $RegistryName/library-auth:$Major.$Minor.$Patch
        Write-Output "push done"
        
    }
    
    ########################
    # main execution point
    ########################
    Build-Docker-Images -Major $Major -Minor $Minor -Patch $Patch
    Push-Docker-Images -Major $Major -Minor $Minor -Patch $Patch

    Write-Output "work done"
}
End {
    
}