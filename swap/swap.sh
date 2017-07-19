# Using a file to create SWAP partition.

free -h
dd if=/dev/zero of=/mnt/swapfile bs=1M count=2048
# Set only root can access this file
chmod 600 /mnt/swapfile
mkswap /mnt/swapfile
swapon /mnt/swapfile

# To make it permanent, you may need to add the “/etc/fstab” entry
cat /etc/fstab | grep "swap"
/mnt/swapfile swap swap defaults 0 0

# To enable : swapon -a and to disable swapoff -a

free -h
