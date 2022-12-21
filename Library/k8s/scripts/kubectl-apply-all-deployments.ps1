Begin {
    
}

Process {

    function Invoke-All-Deployments {
        kubectl apply -f ../files/library-books-deployment.yaml
        kubectl apply -f ../files/library-shop-deployment.yaml
        kubectl apply -f ../files/library-ui-deployment.yaml
        kubectl apply -f ../files/library-hub-deployment.yaml
        kubectl apply -f ../files/library-auth-deployment.yaml
        kubectl delete -f ../files/library-ingress-service.yaml
        Write-Output "apply done"
 
        kubectl get pods --namespace=library 
        kubectl get services --namespace=library
        kubectl get deployments --namespace=library
        kubectl get replicaset --namespace=library
        kubectl get ingress --namespace=library
    }
    
    ######################
    # main execution point
    ######################
    Invoke-All-Deployments 

    Write-Output "work done"
}
End {
    
}