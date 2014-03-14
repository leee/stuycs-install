This install system is pretty much in beta - use at your own risk.

StuyCS Lab Install - Ubuntu 12.04.1 LTS (Precise Pangolin)

Booting into a USB install disk
* Dell all-in-one setups: F12
* 307 hack-jobs: DEL, Advanced Options, Move USB to top of list

Initial Installation
1. Keyboard: do-not-detect, normal, auto, USA, whatever that gets you through this mess.
2. Auto IP setup via DHCP may or may not succeed - regardless, select the option to do a manual IP setup the minute you see it.
3. Host IP is: 149.89.200.1aa, where aa depends. Ask someone in 307 about it.
4. Subnet mask: 255.255.0.0
5. Gateway: 149.89.1.24
6. Name Server Address: same as Gateway
7. Hostname: hotswap-aa
8. Domain: stuy.edu

User Creation
1. User Name: service
2. username: service
3. Password: ask for this
4. Encrypt Home Directory: NO NO NO

Almost Done
1. Time Zone: EST
2. Writing changes to drive: Guided, use entire disk with NO LVM
3. Select disk to partition (there should only be one)
4. Write changes to disk: yes
5. proxy info / package manager: http://149.89.17.91:3142
6. auto update: NO
7. packages: select OpenSSH with your spacebar
8. GRUB: YES
9. UTC: YES
10. Reboot
11. Login as service
12. run the install script

