# 🏡 Terraform Proxmox

Automate your Proxmox VE infrastructure provisioning with Terraform, enabling robust and reproducible deployments.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![License](https://img.shields.io/badge/license-Apache_2.0-green)
![Stars](https://img.shields.io/github/stars/hedi0/terraform-proxmox?style=social)
![Forks](https://img.shields.io/github/forks/hedi0/terraform-proxmox?style=social)

![Project Preview](/images/ter_prox.png)

## ✨ Features

*   🚀 **Automated Infrastructure Provisioning:** Seamlessly create, manage, and destroy Proxmox Virtual Machines (VMs) and Container Templates (CTs) using declarative configuration.
*   📝 **Infrastructure as Code (IaC):** Define your Proxmox environment in HCL, allowing for version control, collaboration, and consistent deployments.
*   🛡️ **Idempotent Deployments:** Ensure your Proxmox infrastructure matches your desired state every time you run Terraform, preventing configuration drift.
*   ⚙️ **Resource Management:** Easily configure network interfaces, storage, CPU, memory, and more for your Proxmox resources.
*   🔄 **Reproducible Environments:** Quickly spin up identical Proxmox setups for development, testing, or production environments.

## 🛠️ Installation Guide

To get started with `terraform-proxmox`, you'll need Terraform installed and configured with the Proxmox provider.

### Prerequisites

1.  **Terraform :** Download and install Terraform in the Proxmox VM shell ( Web Interface ) .
2.  **Proxmox VE Instance:** A running Proxmox Virtual Environment instance with API access enabled.
3.  **Proxmox API Token:** Create an API token for a user on your Proxmox VE for Terraform to authenticate.

### Step-by-Step Installation

1.  **Clone the Repository:**
    Start by cloning this repository to your local machine:

    ```bash
    git clone https://github.com/hedi0/terraform-proxmox.git
    cd terraform-proxmox
    ```

2.  **Configure Proxmox Provider:**
    Create the 3 Files in the `codes/` folder in your Proxmox Local Storage. Ensure you use the correct source for the Proxmox provider.
    ![create](/images/Add_the_ISO_IMAGE_to_local.png)
    
    ```hcl
    # provider.tf
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

4.  **Set Proxmox API Credentials:**
    You can use environment variables for sensitive information like API tokens.

    ![Adding the Terraform User](/images/users.png)

    ```hcl
    # terraform.tfvars
    proxmox_token_secret = "PASTE_YOUR_TOKEN_HERE"
    ```
    
    Alternatively, you can configure them directly in your `provider.tf` file (not recommended for production):

    ```hcl
    # provider.tf
    provider "proxmox" {
     endpoint  = "https://PASTE_YOUR_VM_IP_HERE:8006/"
     api_token = "terraform@pve!terraform-token=${var.proxmox_token_secret}"
    }
    ```

6.  **Initialize Terraform:**
    Navigate to your project directory and initialize Terraform to download the Proxmox provider:

    ```bash
    terraform init
    ```

## 🚀 Usage Examples

Once installed and configured, you can start defining your Proxmox infrastructure.

### Basic VM Provisioning

Here's an example of how to create a simple Ubuntu VM on your Proxmox host using Terraform.
<a href="/codes/main.tf">

    You Can see the 

</a>
To apply this configuration:

1.  **Plan the changes:**
    ```bash
    terraform plan
    ```
2.  **Apply the changes:**
    ```bash
    terraform apply
    ```
    Type `yes` when prompted to confirm the creation.

### Configuration Options

The Proxmox provider supports a wide range of resources and arguments. Refer to the official [Terraform Proxmox Provider Documentation](https://registry.terraform.io/providers/telmate/proxmox/latest/docs) for a comprehensive list of all configurable options.

| Option        | Description                                     | Type    | Default      |
| :------------ | :---------------------------------------------- | :------ | :----------- |
| `target_node` | The Proxmox node where the VM/CT will be created. | `string` | (Required)   |
| `clone`       | The name of the template to clone from.         | `string` | (Required)   |
| `name`        | The name of the new VM/CT.                      | `string` | (Required)   |
| `memory`      | Total memory in MB.                             | `number` | `512`        |
| `cpu.cores`   | Number of CPU cores.                            | `number` | `1`          |
| `disk.size`   | Size of the disk in GB.                         | `string` | `32G`        |
| `network`     | Network interface configuration.                | `object` | (See docs)   |
| `cloud_init`  | Cloud-init configuration for initial setup.     | `object` | (See docs)   |

![Usage Screenshot Placeholder](/images/terraform_after_apply.png)

## 🗺️ Project Roadmap

We are continuously working to enhance the `terraform-proxmox` project. Here's a glimpse of what's planned:

*   **Version 1.1.0:**
    *   Expand support for more Proxmox resource types (e.g., storage, firewall rules).
    *   Provide official Terraform modules for common Proxmox setups.
    *   Improve error handling and user feedback during provisioning.
*   **Future Enhancements:**
    *   Integrate with external secrets management solutions.
    *   Advanced network configuration examples and modules.
    *   Automated testing for common configurations.
    *   Comprehensive documentation with more real-world examples.

## 🤝 Contribution Guidelines

We welcome contributions to the `terraform-proxmox` project! To ensure a smooth collaboration, please follow these guidelines:

1.  **Fork the Repository:** Start by forking the repository to your GitHub account.
2.  **Create a Branch:**
    *   For new features: `git checkout -b feature/your-feature-name`
    *   For bug fixes: `git checkout -b fix/your-fix-name`
3.  **Code Style:**
    *   Ensure your HCL code is formatted using `terraform fmt`.
    *   Follow existing code conventions.
4.  **Commit Messages:** Write clear and concise commit messages. A good commit message explains *what* changed and *why*.
5.  **Testing:** If you're adding a new feature or fixing a bug, please consider adding relevant tests (if applicable, especially for modules).
6.  **Pull Requests (PRs):**
    *   Open a pull request to the `main` branch of this repository.
    *   Provide a detailed description of your changes.
    *   Reference any related issues.
    *   Ensure your branch is up-to-date with the `main` branch before submitting.

## 📄 License Information

This project is licensed under the **Apache License 2.0**.

You can find the full text of the license in the [LICENSE](LICENSE) file.

**Copyright (c) 2023 hedi0**

Feel free to use, modify, and distribute this software in accordance with the terms of the Apache License 2.0.
