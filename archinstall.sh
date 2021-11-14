#!/bin/sh

loadkeys us
timedatectl set-ntp true
lsblk
echo "Enter the drive: "
read drive
cfdisk $drive
echo "Enter the linux partition: "
read partition
mkfs.ext4 $partition 
read -p "Did you also create efi partition? [y/n]" answer
if [[ $answer = y ]] ; then
  echo "Enter EFI partition: "
  read efipartition
  mkfs.vfat -F 32 $efipartition
fi
mount $partition /mnt 
pacstrap /mnt base base-devel linux linux-firmware git
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash <<EOF
  ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
  hwclock --systohc
  echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
  locale-gen
  echo "LANG=en_US.UTF-8" > /etc/locale.conf
  echo "KEYMAP=us" > /etc/vconsole.conf
  echo "Hostname: "
  read hostname
  echo $hostname > /etc/hostname
  echo "127.0.0.1       localhost" >> /etc/hosts
  echo "::1             localhost" >> /etc/hosts
  echo "127.0.1.1       $hostname.localdomain $hostname" >> /etc/hosts
  mkinitcpio -P
  passwd
  pacman --noconfirm -S grub efibootmgr os-prober networkmanager
  echo "Enter EFI partition: " 
  read efipartition
  mkdir /boot/efi
  mount $efipartition /boot/efi 
  grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
  #sed -i 's/quiet/pci=noaer/g' /etc/default/grub
  #sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
  grub-mkconfig -o /boot/grub/grub.cfg
  systemctl enable NetworkManager.service
  echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
  echo "Enter Username: "
  read username
  useradd -m -G wheel,audio,video -s /bin/bash $username
  passwd $username
  exit
EOF
umount -R /mnt
reboot
