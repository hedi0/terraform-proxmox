# 🏡 Terraform Proxmox

Automate your **Proxmox VE** infrastructure provisioning using
**Terraform**, enabling robust, reproducible, and version-controlled
deployments.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-Apache_2.0-green)
![Stars](https://img.shields.io/github/stars/hedi0/terraform-proxmox?style=social)
![Forks](https://img.shields.io/github/forks/hedi0/terraform-proxmox?style=social)

![Project Preview](/images/ter_prox.png)

------------------------------------------------------------------------

## ✨ Features

-   🚀 **Automated Infrastructure Provisioning**\
    Create, manage, and destroy Proxmox Virtual Machines (VMs) and
    Containers (CTs) using Terraform.

-   📝 **Infrastructure as Code (IaC)**\
    Declarative HCL configurations enable version control,
    collaboration, and repeatable deployments.

-   🛡️ **Idempotent Deployments**\
    Terraform ensures your infrastructure always matches the desired
    state.

-   ⚙️ **Flexible Resource Management**\
    Configure CPU, memory, disks, networking, cloud-init, and more.

-   🔄 **Reproducible Environments**\
    Easily recreate identical environments for development, testing, or
    production.

------------------------------------------------------------------------

## 🛠️ Installation Guide

### Prerequisites

1.  **Terraform**\
    Install Terraform on your system or directly inside a Proxmox VM.

2.  **Proxmox VE**\
    A running Proxmox Virtual Environment with API access enabled.

3.  **Proxmox API Token**\
    Create an API token for secure authentication.

------------------------------------------------------------------------

### Step-by-Step Setup

#### 1️⃣ Clone the Repository

``` bash
git clone https://github.com/hedi0/terraform-proxmox.git
cd terraform-proxmox
```

------------------------------------------------------------------------

#### 2️⃣ Configure the Terraform Provider

Create the following files inside the `codes/` directory (stored on
Proxmox local storage):

``` hcl
terraform {
  required_version = ">= 1.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.70"
    }
  }
}
```

------------------------------------------------------------------------

#### 3️⃣ Configure Authentication (Recommended: Environment Variables)

``` bash
export TF_VAR_proxmox_token_secret="PASTE_YOUR_TOKEN_HERE"
```

``` hcl
provider "proxmox" {
  endpoint  = "https://YOUR_PROXMOX_IP:8006/"
  api_token = "terraform@pve!terraform-token=${var.proxmox_token_secret}"
}
```

------------------------------------------------------------------------

#### 4️⃣ Initialize Terraform

``` bash
terraform init
```

------------------------------------------------------------------------

## 🚀 Usage Examples

📄 **[`codes/main.tf`](codes/main.tf)**

``` bash
terraform plan
terraform apply
```

------------------------------------------------------------------------

## ⚙️ Configuration Options

  --------------------------------------------------------------------------
  Option          Description                          Type       Default
  --------------- ------------------------------------ ---------- ----------
  `target_node`   Proxmox node name                    `string`   Required

  `clone`         Template name                        `string`   Required

  `name`          VM or CT name                        `string`   Required

  `memory`        RAM in MB                            `number`   512

  `cpu.cores`     Number of CPU cores                  `number`   1
  --------------------------------------------------------------------------

------------------------------------------------------------------------

## 🤝 Contributing

Pull requests are welcome. Please format code using:

``` bash
terraform fmt
```

------------------------------------------------------------------------

## 📄 License

Licensed under the **Apache License 2.0**.

**© 2023--2025 hedi0**
