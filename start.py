import os
import csv
from os import walk
import re
from typing import Type
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

gpu = os.popen("lspci -nn | grep VGA").read() # Gets name of gpu
# This reads out an iommu device with VGA in its name
print("Select your gpu:")
gpu = gpu.splitlines()
number = 0
gpus = []
for line in gpu:
    print("["+str(number) + "] " + line)
    gpus.append(line)
    number +=1
gpu_choice = input("")
gpu_choice = gpus[int(gpu_choice)]
print(gpu_choice)
#This should extract the gpus number
gpu_choice = re.findall("[\d]*:[\d]*.[\d]*", gpu_choice)
gpu_num = gpu_choice[0]
#Add gpu brand selector
#Write changes to the files.



#this should go at the end
if os.path.isfile("/etc/libvirt/hooks/qemu") == False:
    os.system("sudo mv hooks /etc/libvirt/")
else:
    print("You already have hooks for libvirt.")
