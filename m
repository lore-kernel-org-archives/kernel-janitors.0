From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Tue, 30 Jul 2013 15:52:02 +0000
Subject: Unable to use Own USB Module
Message-Id: <51F7DE52.5060606@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi All,

I'm a newbie so please don't spare me if this question seems too amateur.

I wanted to try making a basic USB module and use it for test so that i 
can get basic understanding of working of USB modules.

I compiled and booted with kernel 3.11-rc2 with USB_STORAGE=Y following
	http://www.linuxtopia.org/online_books/linux_kernel/kernel_configuration/ch09.html#lkn_usb_storage

Iut i'm unable to find module using my USB. i gave a blind attempt of 
"rmmod usb-storage" (just thought if usb-storage is present) but no 
luck. my dmesg show following
====================
 > [ 5610.837681] hub 2-1:1.0: state 7 ports 6 chg 0000 evt 0004 
 
 

 > [ 5610.837972] hub 2-1:1.0: port 2, status 0100, change 0001, 12 Mb/s 
 
 

 > [ 5610.837984] usb 2-1.2: USB disconnect, device number 8 
 
 

 > [ 5610.837989] usb 2-1.2: unregistering device 
 
 

 > [ 5610.837995] usb 2-1.2: unregistering interface 2-1.2:1.0 
 
 

 > [ 5610.839598] usb 2-1.2: usb_disable_device nuking all URBs 
 
 

 > [ 5610.945813] hub 2-1:1.0: debounce: port 2: total 100ms stable 
100ms status 0x100
 > [ 5620.830115] hub 2-1:1.0: state 7 ports 6 chg 0000 evt 0004
 > [ 5620.830400] hub 2-1:1.0: port 2, status 0101, change 0001, 12 Mb/s
 > [ 5620.934424] hub 2-1:1.0: debounce: port 2: total 100ms stable 
100ms status 0x101
 > [ 5620.945442] hub 2-1:1.0: port 2 not reset yet, waiting 10ms
 > [ 5621.007351] usb 2-1.2: new high-speed USB device number 9 using 
ehci-pci
 > [ 5621.018348] hub 2-1:1.0: port 2 not reset yet, waiting 10ms
 > [ 5621.093327] usb 2-1.2: default language 0x0409
 > [ 5621.095323] usb 2-1.2: udev 9, busnum 2, minor = 136
 > [ 5621.095334] usb 2-1.2: New USB device found, idVendorf0, 
idProductV07
 > [ 5621.095340] usb 2-1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
 > [ 5621.095345] usb 2-1.2: Product: v210w
 > [ 5621.095350] usb 2-1.2: Manufacturer: HP
 > [ 5621.095355] usb 2-1.2: SerialNumber: 0000000000000026
 > [ 5621.095484] usb 2-1.2: usb_probe_device
 > [ 5621.095492] usb 2-1.2: configuration #1 chosen from 1 choice
 > [ 5621.095662] usb 2-1.2: adding 2-1.2:1.0 (config #1, interface 0)
 > [ 5621.095778] usb-storage 2-1.2:1.0: usb_probe_interface
 > [ 5621.095799] usb-storage 2-1.2:1.0: usb_probe_interface - got id
 > [ 5621.095807] usb-storage 2-1.2:1.0: USB Mass Storage device detected
 > [ 5621.095990] scsi9 : usb-storage 2-1.2:1.0
 > [ 5622.099125] scsi 9:0:0:0: Direct-Access     hp       v210w 
     0.00 PQ: 0 ANSI: 4
 > [ 5622.099270] sd 9:0:0:0: Attached scsi generic sg2 type 0
 > [ 5622.101119] sd 9:0:0:0: [sdb] 15773696 512-byte logical blocks: 
(8.07 GB/7.52 GiB)
 > [ 5622.102499] sd 9:0:0:0: [sdb] Write Protect is off
 > [ 5622.102504] sd 9:0:0:0: [sdb] Mode Sense: 23 00 00 00
 > [ 5622.103771] sd 9:0:0:0: [sdb] Write cache: disabled, read cache: 
enabled, doesn't support DPO or FUA
 > [ 5622.113635]  sdb: sdb1
 > [ 5622.130293] sd 9:0:0:0: [sdb] Attached SCSI removable disk
============================================

My device is using device driver "ehci-pci" but no module

Again i don't understand what is the difference b/w device driver  and 
modules (i used to think that both are same).
What can be the method of using my module to use my USB(mass storage 
device).
when i'm using the default kernel provided by my kubuntu 12.04 ie 
"3.2.0-37-generic" i'm able to rmmod usb-storage. But i wanna try with 
3.11-rc2.

Please help

Regards
Kumar gaurav
