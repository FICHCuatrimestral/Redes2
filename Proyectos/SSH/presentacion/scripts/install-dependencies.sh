# Install Quarto
if [ "$(uname -m)" = "aarch64" ]; then
  QUARTO_ARCH="arm64"
else
  QUARTO_ARCH="amd64"
fi

sudo mkdir -p /tmp/quarto

sudo curl -o /tmp/quarto/quarto.deb -L \
    "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-${QUARTO_ARCH}.deb"

sudo dpkg -i /tmp/quarto/quarto.deb

sudo rm /tmp/quarto/quarto.deb
sudo rmdir /tmp/quarto

# Install pip dependencies
pip3 install --upgrade pip
pip3 install --user -r requirements.txt

# Quarto check
quart check install
