param (
    [string]$storageAccount = "ventasgastos01",
    [string]$container = "data"
)

# Crea el contenedor si no existe
az storage container create `
    --name $container `
    --account-name $storageAccount `
    --auth-mode login

# Sube todos los CSV y TXT de la carpeta actual
az storage blob upload-batch `
    --account-name $storageAccount `
    --destination $container `
    --source .
