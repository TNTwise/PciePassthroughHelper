# Helpful to read output when debugging
set -x

# load variables
source "/etc/libvirt/hooks/kvm.conf"
pkill gnome-shell
# Stop display manager
systemctl stop display-manager.service
## Uncomment the following line if you use GDM
#killall gdm-x-session
systemctl stop sddm.service
# Unbind VTconsoles
echo 0 > /sys/class/vtconsole/vtcon0/bind
# Unbind EFI-Framebuffer
echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

# Avoid a Race condition by waiting 2 seconds. This can be calibrated to be shorter or longer if required for your system
sleep 3

#unload nvidia
modprobe -r nvidia_drm
modprobe -r nvidia_modeset
modprobe -r drm_kms_helper
modprobe -r nvidia
modprobe -r i2c_nvidia_gpu
modprobe -r drm
modprobe -r nvidia_uvm
# Unbind the GPU from display driver
virsh nodedev-detach $VIRSH_GPU_VIDEO
virsh nodedev-detach $VIRSH_GPU_AUDIO

# Load VFIO Kernel Module
modprobe vfio  
modprobe vfio-pci
modprobe vfio-iommu-type1  
