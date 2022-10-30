
CWD=$(pwd)
sudo pacman -Syu
sudo pacman -S iptables-nft --noconfirm
sudo pacman -S qemu swtpm libvirt virt-manager dnsmasq edk2-ovmf git dunst lxappearance mpv npm base-devel --noconfirm
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
sudo systemctl enable virtlogd.socket
sudo systemctl start virtlogd.socket
sudo mv hooks /etc/libvirt/
sudo chmod +x /etc/libvirt/hooks/qemu.d/win10-hyperv/prepare/begin/start.sh
sudo chmod +x /etc/libvirt/hooks/qemu.d/win10-hyperv/prepare/begin/isolstart.sh
sudo chmod +x /etc/libvirt/hooks/qemu.d/win10-hyperv/release/end/revert.sh
sudo chmod +x /etc/libvirt/hooks/qemu.d/win10-hyperv/release/end/isocpurevert.sh
sudo chmod +x /etc/libvirt/hooks/qemu.d/win11/prepare/begin/start.sh
sudo chmod +x /etc/libvirt/hooks/qemu.d/win11/prepare/begin/isolstart.sh
sudo chmod +x /etc/libvirt/hooks/qemu.d/win11/release/end/revert.sh
sudo chmod +x /etc/libvirt/hooks/qemu.d/win11/release/end/isocpurevert.sh
sudo chmod +x /etc/libvirt/hooks/qemu.d/win11/release/end/*
sudo chmod +x /etc/libvirt/hooks/qemu.d/win10-hyperv/release/end/*
sudo chmod +x /etc/libvirt/hooks/qemu.d/win10-hyperv/prepare/begin/*
sudo chmod +x /etc/libvirt/hooks/qemu.d/win11/prepare/begin/*
sudo mv patch.rom /var/lib/libvirt/images/
sudo chmod +x /etc/libvirt/hooks/qemu
sudo mv win10-hyperv.xml /etc/libvirt/qemu/win10.xml
sudo mv win11.xml /etc/libvirt/qemu/win11.xml

