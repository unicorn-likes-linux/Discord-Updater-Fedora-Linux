
#!/bin/bash

curl -L -o /tmp/discord.tar.gz 'https://discord.com/api/download?platform=linux&format=tar.gz'
sudo tar -xzf /tmp/discord.tar.gz -C /tmp

INSTALLED_VER=$(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /opt/Discord/resources/build_info.json)
DOWNLOADED_VER=$(grep -o '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}' /tmp/Discord/resources/build_info.json)

if [ $INSTALLED_VER == $DOWNLOADED_VER ]; then

	echo "No new version detected, current version installed: $INSTALLED_VER"


else
	echo "New version detected, updating, version: $DOWNLOADED_VER"
	sudo rm -rf /opt/Discord.old #remove old backup
	sudo mv /opt/Discord /opt/Discord.old #backup
	sudo mv /tmp/Discord /opt/Discord #install new version 

fi
