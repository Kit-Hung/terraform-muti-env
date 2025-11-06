# terraform-muti-env
## 目录结构
terraform-muti-env/
├── common/
│   ├── modules/
│   │   ├── network/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   │   └── outputs.tf
│   │   └── s3/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── outputs.tf
│   ├── variables.tf
│   └── outputs.tf
├── prod/
│   ├── main.tf
│   ├── variables.tf
│   ├── eu-west-1.tfvars
│   └── eu-west-2.tfvars
└── dev/
├── main.tf
├── variables.tf
├── eu-west-1.tfvars
└── eu-west-2.tfvars


## 使用方式
```shell
terraform init
terraform plan -var-file="eu-west-1.tfvars"
terraform apply -var-file="eu-west-1.tfvars"
```