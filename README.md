# terraform-muti-env
## 目录结构
terraform-muti-env/
├── terragrunt.hcl                         # 顶层通用配置（remote_state等）
├── common/
│   └── modules/
│       ├── network/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       ├── s3/
│       │   ├── main.tf
│       │   ├── variables.tf
│       │   └── outputs.tf
│       └── ecs/
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
├── prod/
│   ├── terragrunt.hcl                     # 定义环境级变量(env=prod)
│   ├── eu-west-1/
│   │   ├── network/
│   │   │   └── terragrunt.hcl
│   │   ├── s3/
│   │   │   └── terragrunt.hcl
│   │   └── ecs/
│   │       └── terragrunt.hcl
│   └── eu-west-2/
│       ├── network/
│       │   └── terragrunt.hcl
│       ├── s3/
│       │   └── terragrunt.hcl
│       └── ecs/
│           └── terragrunt.hcl
└── dev/
├── terragrunt.hcl
├── eu-west-1/
│   ├── network/
│   │   └── terragrunt.hcl
│   ├── s3/
│   │   └── terragrunt.hcl
│   └── ecs/
│       └── terragrunt.hcl
└── eu-west-2/
├── network/
│   └── terragrunt.hcl
├── s3/
│   └── terragrunt.hcl
└── ecs/
└── terragrunt.hcl



## 使用方式
### 单个 region 单个模块（例如 prod 环境的 eu-west-1 网络）
```shell
cd terraform-muti-env/prod/eu-west-1/network
terragrunt init
terragrunt plan
terragrunt apply
```


### 单环境（prod）自动并行多 region 部署
执行顺序：
所有 eu-west-* 下的 network 模块同时运行；
完成后，同时运行所有 s3；
完成后，同时运行所有 ecs。


```shell
cd terraform-muti-env/prod
terragrunt run-all apply --terragrunt-parallelism 4
```


#### 单环境（prod）自动并行多 region 部署, 同时查看日志（可选）
输出包含被依赖模块的日志

```shell
cd terraform-muti-env/prod
terragrunt run-all apply --terragrunt-parallelism 4 --terragrunt-include-external-dependencies
```

### 整个 region 下的所有模块（network + s3 + ecs）
```shell
cd terraform-muti-env/prod/eu-west-1
terragrunt run-all plan
terragrunt run-all apply
```


### 同环境下多个 region 一起执行
```shell
cd terraform-muti-env/prod
terragrunt run-all plan
terragrunt run-all apply
```


### 全部环境一起执行
```shell
cd terraform-muti-env
terragrunt run-all plan
terragrunt run-all apply
```


### 模块间依赖的可视化
```shell
cd terraform-muti-env
terragrunt graph-dependencies | dot -Tpng > graph.png
```