# Getting started :  Consommation GitHub Action CI/CD (Laravel)

### Generate a private key
 `1- Machine local` <br>
 
    openssl genpkey -algorithm RSA -aes-256-cbc -outform PEM -out private_key.pem -pkeyopt rsa_keygen_bits:2048**
    
 `2- Connexion` <br>
 
    la clé gérer plus haut utiliser pour vous connecter à votre serveur d'application </br>

     `ssh-copy-id -i ~/.ssh/private_key.pem username@host_name&&ip_host
     
 `2-  Commande pour tester la connexion au serveur sans mot de passe username` <br>
     