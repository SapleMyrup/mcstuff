
#!/bin/bash
#  Replace <YourMinecraftDirectory> dir where server FOLDER is located
# usage ./update.sh https://mediafilez.forgecdn.net/files/4931/43/Server-Files-0.2.27.zip 0.2.25
# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <New Version URL> <Old Version Number>"
    exit 1
fi

# Assign arguments to variables
NEW_VERSION_URL=$1
OLD_VERSION=$2
NEW_VERSION=$(basename $NEW_VERSION_URL .zip)

# Directory where Minecraft server is located
MC_DIR="<YourMinecraftDirectory>"

# Download the new version
wget $NEW_VERSION_URL

# Enter the Minecraft directory
cd $MC_DIR

# Unzip the new version
unzip $(basename $NEW_VERSION_URL)

# Enter the new version directory
cd $NEW_VERSION

# Copy the world, mods, config, eula.txt, and server.properties from the old version
cp -R ../Server-Files-$OLD_VERSION/world/ ./
# cp ../Server-Files-$OLD_VERSION/mods/dcintegration-forge-3.0.3-1.20.1.jar ./mods/
# cp ../Server-Files-$OLD_VERSION/config/Discord-Integration.toml ./config/
cp ../Server-Files-$OLD_VERSION/eula.txt ./
cp ../Server-Files-$OLD_VERSION/server.properties ./

# Additional commands can be added here as needed

echo "Minecraft server updated from version $OLD_VERSION to $NEW_VERSION"
