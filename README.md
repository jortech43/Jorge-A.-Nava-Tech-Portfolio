About

I installed Proxmox VE hypervisor and configured an OPNsense firewall virtual machine running on a refurbished laptop I fixed; configured VLAN 
subinterfaces with a layer 2 netowrk  switch and OPNsense's inter-VLAN capabilities while studying for Network+

I first created a home network design using a TP-Link SG108E Layer 2 Managed Switch (8 switchports), a used and refurbished Lenovo Laptop that 
I have personally fixed (which I later installed Proxmox VE), and a separate Windows 7 laptop device for testing purposes. During months on working on this
project and studying the Network+, I was able to understand how VLAN segmentation worked while ensuring DHCP, DNS, and subnet configurations played a role
in communicating with other devices connected to the same switch hardware.

I set up Proxmox VE hypervisor on the newly fixed laptop and installed an OPNsense firewall virtual machine inside of the hypervisor to configure firewall 
rules and assign VLAN tags/ sub interfaces. This project required me to perform separate configuration nano script on the Proxmox VE terminal, ensuring 
network interfaces had the proper ethernet WAN/LAN connection. This ensured to gain GUI-based access for all of my firewall VMs inside of Proxmox VE.

I ensured to configure the VLANs on the switch as well, to make sure all devices understood from were 
VLAN tags were being sent. After VLAN tags and PVIDs were properly assigned on the switch, I used OPNsense's firewall logs to keep track whether computers connected
to the switch was assigned to their appropriate subnets. Using the Windows 7 test laptop, it was able to receive its assigned subnet that I had configured on OPNsense
firewall and the switch.

Troubleshooting Issues
Using OPNsense Virtual Firewall allowed me to assign VLANs using the "router-on-a-stick" method, which can be used temporarily for testing purposes. However, to communicate
via inter-VLAN routing capabilities, it is best to use a dedicated Layer 3 switch or an advanced router with VLAN-routing capabilities. Devices connected to the same switch
but with different subnets can only communicate if they are assigned an SVI from an SVI gateway. My goal objective to assign subnets for connected devices and verifying
VLAN tagging was a success, and I plan to add a Layer 3 switch or a dedicated router to ensure full inter-VLAN routing in the future.

