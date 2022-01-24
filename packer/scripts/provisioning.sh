# Add boot script
# sudo cp /tmp/boot.sh /var/lib/cloud/scripts/per-boot/boot.sh
# sudo chmod 744 /var/lib/cloud/scripts/per-boot/boot.sh

# Install MongoDB Libraries
sudo cp /tmp/mongodb-org-5.0.repo /etc/yum.repos.d/mongodb-org-5.0.repo
sudo yum install -y mongodb-org-${MONGO_VERSION}
sudo cp /tmp/mongod.conf /etc/mongod.conf