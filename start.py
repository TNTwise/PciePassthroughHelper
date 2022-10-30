import os
import csv
from os import walk
import re
cwd = os.getcwd() # Gets the current working directory
print("please select your virtual machine: ")
vm_list = []
for (dirpath, dirnames, filenames) in walk("/etc/libvirt/qemu/"):
    if filenames != ['default.xml'] and filenames != []:
        vm_list.append(filenames)

number = 0   
vms = [] # This is the amount of vitrual machines the user has 
for vm_names in vm_list:
    for vm_name in vm_names:
        vm_name = re.findall("[\w]*", vm_name)
        print("["+str(number) +"] "+vm_name[0])
        vms.append(vm_name[0])
        number+=1
        
vm_choice = input("")
vm_choice = vms[int(vm_choice)] # Sets vm_choice to the name of the vm

# This code checks if files exists and moves things around.
if os.path.isfile("hooks/qemu.d/vm hooks/qemu.d/vm") == True:
    os.system("mv hooks/qemu.d/vm hooks/qemu.d/"+vm_choice)
else:
    print("You have already changed the name of this VM's hooks.")
if os.path.isfile("/etc/libvirt/hooks/qemu") == False:
    os.system("sudo mv hooks /etc/libvirt/")
else:
    print("You already have hooks for libvirt.")

gpu = os.popen("lspci -nn | grep VGA").read() # Gets name of gpu
# ADD GPU SELECTOR (LOOK AT VM SELECTOR)
gpu_choice = print("Select your gpu:")
print(gpu)