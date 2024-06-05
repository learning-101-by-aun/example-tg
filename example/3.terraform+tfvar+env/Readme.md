```
#Create New Workspace
terraform workspace new dev
terraform workspace new sit
terraform workspace new uat
terraform workspace new prod

#Current Workspace
terraform workspace show

#Select Workspace
terraform workspace select dev

#list All Workspace
terraform workspace list
```

```
#ENV DEV
terraform init
terraform fmt
terraform validate
terraform plan -var-file=dev/dev-input.tfvars
terraform apply -var-file=dev/dev-input.tfvars
terraform destroy -var-file=dev/dev-input.tfvars
```

```
#ENV SIT
terraform init
terraform fmt
terraform validate
terraform plan -var-file=sit/sit-input.tfvars
terraform apply -var-file=sit/sit-input.tfvars
terraform destroy -var-file=sit/sit-input.tfvars
```

```
#ENV UAT
terraform init
terraform fmt
terraform validate
terraform plan -var-file=uat/uat-input.tfvars
terraform apply -var-file=uat/uat-input.tfvars
terraform destroy -var-file=uat/uat-input.tfvars
```

```
#ENV PROD
terraform init
terraform fmt
terraform validate
terraform plan -var-file=prod/prod-input.tfvars
terraform apply -var-file=prod/prod-input.tfvars
terraform destroy -var-file=prod/prod-input.tfvars
```