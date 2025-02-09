Write-Host "Initializing Terraform..."
terraform init

Write-Host "Applying Terraform configuration..."
terraform apply -auto-approve

Write-Host "Checking instance ID output..."
$instanceIds = terraform output -json instance_ids | ConvertFrom-Json

if ($instanceIds.Count -eq 0) {
    Write-Error "Test failed: No instance IDs found"
} else {
    Write-Host "Test passed: Instance IDs created successfully:"
    Write-Host $instanceIds
}

Write-Host "Cleaning up Terraform resources..."
terraform destroy -auto-approve