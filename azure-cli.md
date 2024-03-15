# Install Azure CLI

[Install Azure CLI Linux (apt Ubuntu, Debian)](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux)

```
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

---
### Install Azure CLI (RHEL, Centos)
[Install Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=dnf#install-azure-cli)

- Import the Microsoft repository key.
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
```

- For RHEL 9 or CentOS Stream 9, add packages-microsoft-com-prod repository:
```
sudo dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
```

- For RHEL 8 or CentOS Stream 8, add packages-microsoft-com-prod repository:
```
sudo dnf install -y https://packages.microsoft.com/config/rhel/8/packages-microsoft-prod.rpm
```

- For RHEL 7 or CentOS 7, add azure-cli repository:
```
echo -e "[azure-cli]
name=Azure CLI
baseurl=https://packages.microsoft.com/yumrepos/azure-cli
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/azure-cli.repo
```

---
### Install or update Azure CLI
[Install or update Azure CLI (any)](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=script#install-or-update-azure-cli)

```
curl -L https://aka.ms/InstallAzureCli | bash
```

---
### Check az
```
which az
```