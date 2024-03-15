Install kubectl on Linux
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

curl -LO https://dl.k8s.io/release/v1.28.4/bin/linux/arm64/kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sudo install -o root -g root -m 0755 kubectl /usr/bin/kubectl
rm -f kubectl