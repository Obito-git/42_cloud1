# Explanation:
# 1.command > /dev/null: redirects the output of command(stdout) to /dev/null
# 2.2>&1: redirects stderr to stdout, so errors (if any) also goes to /dev/null

sudo ls   > /dev/null 2>&1
echo "system update and upgrade..."
sudo apt-get -y upgrade  > /dev/null 2>&1
sudo apt-get -y update  > /dev/null 2>&1

echo "Installing curl, vim, git, make and docker dependencies"
sudo apt-get install -y curl \
vim \
git \
gnupg \
lsb-release \
ca-certificates \
apt-transport-https \
software-properties-common \
make  > /dev/null 2>&1

echo "Add Docker’s official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor \
-o /etc/apt/keyrings/docker.gpg   > /dev/null 2>&1

#Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker Engine"
sudo apt-get update   > /dev/null 2>&1
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin > /dev/null 2>&1
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Installing docker compose"
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')
DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o \
$DESTINATION   > /dev/null 2>&1
sudo chmod 755 $DESTINATION

#echo "Installing docker-compose 2.7.0"
#sudo curl -L "https://github.com/docker/compose/releases/download/2.7.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# > /dev/null 2>&1
#sudo chmod +x /usr/local/bin/docker-compose   > /dev/null 2>&1
