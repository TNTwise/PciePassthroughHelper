set -x
source "/etc/libvirt/hooks/kvm.conf"

modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# Re-Bind GPU to Nvidia Driver
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO
# Rebind VT consoles
echo 1 > /sys/class/vtconsole/vtcon0/bind
# Some machines might have more than 1 virtual console. Add a line for each corresponding VTConsole
#echo 1 > /sys/class/vtconsole/vtcon1/bind


nvidia-xconfig --query-gpu-info > /dev/null 2>&1

echo "efi-framebuffer.0" > /sys/bus/platform/drivers/efi-framebuffer/bind

# Reload nvidia modules
modprobe nvidia
modprobe nvidia_modeset
modprobe nvidia_uvm
modprobe nvidia_drm
modprobe drm_kms_helper
modprobe drm

# Restart Display Manager
systemctl start display-manager.service
mount -a
