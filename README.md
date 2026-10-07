About Lenovo ThinkPad Repairment
- Configured and diagnosed a Lenovo ThinkPad 4th Gen X1 Carbon that experienced sudden shutdown, immediate battery loss, 
and driver corruption. 
- Diagnosed the BIOS/ UEFI setup using the Memory Hardware Diagnostics, implementing a dual-boot setup with Linux Mint 
and Windows 11, and using Windows command-line interface for troubleshooting driver corruption.

Symptoms
I purchased a Lenovo ThinkPad from a pawn shop; it was poorly kept on a shelf collecting dust. I verified its full 
functionality (it turned on) and opened the boot menu to ensure there was no boot corruption or defective hardware. 
There weren't any issues so I took it home. The laptop turned on fine, but the operating system was freezing at times 
and the laptop would shutdown on its own. Every time I tried to turn it back on, it would make a beep alert and notify 
a Time/Date Error before Boot Menu was shown. I accessed the Boot Menu and attempted to change Time/Date to the correct 
order, the issue was not resolved and continue to beep.

I took note of the device symptoms and researched extensively regarding the source of the issue. I noticed the laptop had 
to be constantly charged to keep it from dying (a symptom of a failing Li-ion battery, due to constant charging). The 
Time/ Date Error on the Boot Menu was also caused by a failing CMOS battery.

As a result, I verified the symptoms and found two hardware components that required replacement:
  - CMOS Battery
  - Li-ion Battery

Solution
Performed a full malware scan on the OS and removed a faulty Firefox web browser from the device. It seemed that someone downloaded the wrong (malware) version of the 
Firefox Browser which is why the search engine glitched so much.
I used Lenovo Diagnostics via Firmware extension to scan for any faulty hardware components or corrupted drives, no sign 
Replaced CMOS battery and Li-ion battery for a new one, disassembled laptop, then reassembled components for repairment procedure
  - 100% Functional
  - No Time/Date Errors

The laptop is now fully functional. I downloaded Linux Mint and created a Dual Boot Setup with Windows OS. The refurbished laptop is currently
being used as a virtual firewall for my Proxmox Virtualization & OPNsense Firewall Lab.
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
About Restoring Toshiba Windows 7 Laptop - Family Computer

Sometimes I am givev unwanted electronics from family, friends, or even colleagues. I believe that most hardware components could be put to good use,
even outdated laptops that are still turned on. I later used this laptop to test my VLAN subnets for my Proxmox Virtualization & OPNsense Firewall Lab.

Symptoms
I could not access any web browsers, most of them were outdated or End of Support. The device could not install any application without an update, which made
it impossible since an update was required to access the search engine or install any new apps.
  Solution: Performed a full restart on the OS

The OS version is Windows 7, it has not been opened since 2010, and old browsers (Norton Antivirus & Internet Explorer) were still on the screen. They
were never removed and had an EOL and EOS expiration date. Norton Antivirus was the main culprit that made the laptop incredibly slow, so I uninstalled the 
software. It took a while due to having to install a Norton-Remover application from 2007.
  Solution: Replaced outdated Norton Antivirus software for Avast Free Antivirus, an alternative up to date version

Windows 7 Toshiba Laptop is now fully functional, replaced Internet Explorer for Firefox. Able to connect laptop to switchport to test VLAN
connectivity. Search engines can be accessed and there is no faulty hardware or corrupted drives.
  
