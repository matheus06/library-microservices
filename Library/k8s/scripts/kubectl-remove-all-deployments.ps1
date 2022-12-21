Begin {
    
}

Process {

    function Remove-Deployments {
        kubectl delete -f ../files/library-books-deployment.yaml
        kubectl delete -f ../files/library-shop-deployment.yaml
        kubectl delete -f ../files/library-ui-deployment.yaml
        kubectl delete -f ../files/library-hub-deployment.yaml
        kubectl delete -f ../files/library-auth-deployment.yaml
        kubectl delete -f ../files/library-ingress-service.yaml
        Write-Output "remove done"
 
        kubectl get pods --namespace=library 
        kubectl get services --namespace=library
        kubectl get deployments --namespace=library
        kubectl get replicaset --namespace=library
        kubectl get ingress --namespace=library
    }
    
    ######################
    # main execution point
    ######################
    Remove-Deployments 

    Write-Output "work done"
}
End {
    
}