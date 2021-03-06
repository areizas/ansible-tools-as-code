#system update
sudo apt-get update

#modify source list
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
     sudo tee /etc/apt/sources.list.d/azure-cli.list

#Get Microsoft signing key
sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

#system update and install
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli

az --version