From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 08 Jul 2005 19:00:06 +0000
Subject: [KJ] [PATCH] Spelling fixes for Documentation/
Message-Id: <20050708190006.GA776@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============232524708000728=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============232524708000728==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The attached patch fixes the following spelling errors in Documentation/
        - double "the"
        - Several misspellings of function/functionality
        - infomation
        - memeory
        - Recieved
        - wether
and possibly others which I forgot ;-)
Trailing whitespaces on the same line as the typo are also deleted.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 Documentation/00-INDEX                           |    2 +-
 Documentation/DMA-API.txt                        |    2 +-
 Documentation/DocBook/journal-api.tmpl           |    4 ++--
 Documentation/DocBook/usb.tmpl                   |    2 +-
 Documentation/MSI-HOWTO.txt                      |    2 +-
 Documentation/cpu-freq/cpufreq-stats.txt         |    2 +-
 Documentation/cpusets.txt                        |    2 +-
 Documentation/crypto/descore-readme.txt          |    2 +-
 Documentation/ioctl/cdrom.txt                    |    2 +-
 Documentation/networking/bonding.txt             |    4 ++--
 Documentation/networking/wan-router.txt          |    4 ++--
 Documentation/powerpc/eeh-pci-error-recovery.txt |    2 +-
 Documentation/s390/s390dbf.txt                   |    2 +-
 Documentation/scsi/ibmmca.txt                    |    2 +-
 Documentation/sound/alsa/ALSA-Configuration.txt  |    2 +-
 Documentation/uml/UserModeLinux-HOWTO.txt        |    2 +-
 Documentation/usb/gadget_serial.txt              |    2 +-
 Documentation/video4linux/Zoran                  |    2 +-
 18 files changed, 21 insertions(+), 21 deletions(-)

diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/00-INDEX linux-2.6.13-rc2~spelling/Documentation/00-INDEX
--- linux-2.6.13-rc2/Documentation/00-INDEX	2005-07-07 21:28:47.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/00-INDEX	2005-07-07 23:29:28.000000000 +0200
@@ -275,7 +275,7 @@ tty.txt
 unicode.txt
 	- info on the Unicode character/font mapping used in Linux.
 uml/
-	- directory with infomation about User Mode Linux.
+	- directory with information about User Mode Linux.
 usb/
 	- directory with info regarding the Universal Serial Bus.
 video4linux/
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/cpu-freq/cpufreq-stats.txt linux-2.6.13-rc2~spelling/Documentation/cpu-freq/cpufreq-stats.txt
--- linux-2.6.13-rc2/Documentation/cpu-freq/cpufreq-stats.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/cpu-freq/cpufreq-stats.txt	2005-07-08 20:57:38.000000000 +0200
@@ -36,7 +36,7 @@ cpufreq stats provides following statist
 
 All the statistics will be from the time the stats driver has been inserted 
 to the time when a read of a particular statistic is done. Obviously, stats 
-driver will not have any information about the the frequcny transitions before
+driver will not have any information about the frequcny transitions before
 the stats driver insertion.
 
 --------------------------------------------------------------------------------
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/cpusets.txt linux-2.6.13-rc2~spelling/Documentation/cpusets.txt
--- linux-2.6.13-rc2/Documentation/cpusets.txt	2005-07-07 21:28:47.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/cpusets.txt	2005-07-07 23:29:28.000000000 +0200
@@ -265,7 +265,7 @@ rewritten to the 'tasks' file of its cpu
 impacting the scheduler code in the kernel with a check for changes
 in a tasks processor placement.
 
-There is an exception to the above.  If hotplug funtionality is used
+There is an exception to the above.  If hotplug functionality is used
 to remove all the CPUs that are currently assigned to a cpuset,
 then the kernel will automatically update the cpus_allowed of all
 tasks attached to CPUs in that cpuset to allow all CPUs.  When memory
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/crypto/descore-readme.txt linux-2.6.13-rc2~spelling/Documentation/crypto/descore-readme.txt
--- linux-2.6.13-rc2/Documentation/crypto/descore-readme.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/crypto/descore-readme.txt	2005-07-07 23:29:28.000000000 +0200
@@ -1,4 +1,4 @@
-Below is the orginal README file from the descore.shar package.
+Below is the original README file from the descore.shar package.
 ------------------------------------------------------------------------------
 
 des - fast & portable DES encryption & decryption.
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/DMA-API.txt linux-2.6.13-rc2~spelling/Documentation/DMA-API.txt
--- linux-2.6.13-rc2/Documentation/DMA-API.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/DMA-API.txt	2005-07-07 23:29:28.000000000 +0200
@@ -121,7 +121,7 @@ pool's device.
 			dma_addr_t addr);
 
 This puts memory back into the pool.  The pool is what was passed to
-the the pool allocation routine; the cpu and dma addresses are what
+the pool allocation routine; the cpu and dma addresses are what
 were returned when that routine allocated the memory being freed.
 
 
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/DocBook/journal-api.tmpl linux-2.6.13-rc2~spelling/Documentation/DocBook/journal-api.tmpl
--- linux-2.6.13-rc2/Documentation/DocBook/journal-api.tmpl	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/DocBook/journal-api.tmpl	2005-07-08 20:57:22.000000000 +0200
@@ -116,7 +116,7 @@ filesystem. Almost.
 
 You still need to actually journal your filesystem changes, this
 is done by wrapping them into transactions. Additionally you
-also need to wrap the modification of each of the the buffers
+also need to wrap the modification of each of the buffers
 with calls to the journal layer, so it knows what the modifications
 you are actually making are. To do this use  journal_start() which
 returns a transaction handle.
@@ -128,7 +128,7 @@ and its counterpart journal_stop(), whic
 are nestable calls, so you can reenter a transaction if necessary,
 but remember you must call journal_stop() the same number of times as
 journal_start() before the transaction is completed (or more accurately
-leaves the the update phase). Ext3/VFS makes use of this feature to simplify 
+leaves the update phase). Ext3/VFS makes use of this feature to simplify
 quota support.
 </para>
 
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/DocBook/usb.tmpl linux-2.6.13-rc2~spelling/Documentation/DocBook/usb.tmpl
--- linux-2.6.13-rc2/Documentation/DocBook/usb.tmpl	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/DocBook/usb.tmpl	2005-07-07 23:29:28.000000000 +0200
@@ -841,7 +841,7 @@ usbdev_ioctl (int fd, int ifno, unsigned
 		    File modification time is not updated by this request.
 		    </para><para>
 		    Those struct members are from some interface descriptor
-		    applying to the the current configuration.
+		    applying to the current configuration.
 		    The interface number is the bInterfaceNumber value, and
 		    the altsetting number is the bAlternateSetting value.
 		    (This resets each endpoint in the interface.)
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/ioctl/cdrom.txt linux-2.6.13-rc2~spelling/Documentation/ioctl/cdrom.txt
--- linux-2.6.13-rc2/Documentation/ioctl/cdrom.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/ioctl/cdrom.txt	2005-07-07 23:29:28.000000000 +0200
@@ -878,7 +878,7 @@ DVD_READ_STRUCT			Read structure
 
 	error returns:
 	  EINVAL	physical.layer_num exceeds number of layers
-	  EIO		Recieved invalid response from drive
+	  EIO		Received invalid response from drive
 
 
 
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/MSI-HOWTO.txt linux-2.6.13-rc2~spelling/Documentation/MSI-HOWTO.txt
--- linux-2.6.13-rc2/Documentation/MSI-HOWTO.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/MSI-HOWTO.txt	2005-07-07 23:29:28.000000000 +0200
@@ -430,7 +430,7 @@ which may result in system hang. The sof
 MSI-capable hardware is responsible for whether calling
 pci_enable_msi or not. A return of zero indicates the kernel
 successfully initializes the MSI/MSI-X capability structure of the
-device funtion. The device function is now running on MSI/MSI-X mode.
+device function. The device function is now running on MSI/MSI-X mode.
 
 5.6 How to tell whether MSI/MSI-X is enabled on device function
 
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/networking/bonding.txt linux-2.6.13-rc2~spelling/Documentation/networking/bonding.txt
--- linux-2.6.13-rc2/Documentation/networking/bonding.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/networking/bonding.txt	2005-07-07 23:29:28.000000000 +0200
@@ -1082,7 +1082,7 @@ traffic while still maintaining carrier 
 
 	If running SNMP agents, the bonding driver should be loaded
 before any network drivers participating in a bond.  This requirement
-is due to the the interface index (ipAdEntIfIndex) being associated to
+is due to the interface index (ipAdEntIfIndex) being associated to
 the first interface found with a given IP address.  That is, there is
 only one ipAdEntIfIndex for each IP address.  For example, if eth0 and
 eth1 are slaves of bond0 and the driver for eth0 is loaded before the
@@ -1568,7 +1568,7 @@ switches currently available support 802
 	If not explicitly configured with ifconfig, the MAC address of
 the bonding device is taken from its first slave device. This MAC
 address is then passed to all following slaves and remains persistent
-(even if the the first slave is removed) until the bonding device is
+(even if the first slave is removed) until the bonding device is
 brought down or reconfigured.
 
 	If you wish to change the MAC address, you can set it with
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/networking/wan-router.txt linux-2.6.13-rc2~spelling/Documentation/networking/wan-router.txt
--- linux-2.6.13-rc2/Documentation/networking/wan-router.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/networking/wan-router.txt	2005-07-07 23:29:28.000000000 +0200
@@ -355,7 +355,7 @@ REVISION HISTORY
 				There is no functional difference between the two packages         
 
 2.0.7   Aug 26, 1999		o  Merged X25API code into WANPIPE.
-				o  Fixed a memeory leak for X25API
+				o  Fixed a memory leak for X25API
 				o  Updated the X25API code for 2.2.X kernels.
 				o  Improved NEM handling.   
 
@@ -514,7 +514,7 @@ beta2-2.2.0	Jan 8 2001
 				o Patches for 2.4.0 kernel
 				o Patches for 2.2.18 kernel
 				o Minor updates to PPP and CHLDC drivers.
-				  Note: No functinal difference. 
+				  Note: No functional difference.
 
 beta3-2.2.9	Jan 10 2001
 				o I missed the 2.2.18 kernel patches in beta2-2.2.0
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/powerpc/eeh-pci-error-recovery.txt linux-2.6.13-rc2~spelling/Documentation/powerpc/eeh-pci-error-recovery.txt
--- linux-2.6.13-rc2/Documentation/powerpc/eeh-pci-error-recovery.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/powerpc/eeh-pci-error-recovery.txt	2005-07-08 20:57:55.000000000 +0200
@@ -134,7 +134,7 @@ pci_get_device_by_addr() will find the p
 with that address (if any).
 
 The default include/asm-ppc64/io.h macros readb(), inb(), insb(),
-etc. include a check to see if the the i/o read returned all-0xff's.
+etc. include a check to see if the i/o read returned all-0xff's.
 If so, these make a call to eeh_dn_check_failure(), which in turn
 asks the firmware if the all-ff's value is the sign of a true EEH
 error.  If it is not, processing continues as normal.  The grand
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/s390/s390dbf.txt linux-2.6.13-rc2~spelling/Documentation/s390/s390dbf.txt
--- linux-2.6.13-rc2/Documentation/s390/s390dbf.txt	2005-07-07 21:28:47.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/s390/s390dbf.txt	2005-07-07 23:29:28.000000000 +0200
@@ -468,7 +468,7 @@ The hex_ascii view shows the data field 
 The raw view returns a bytestream as the debug areas are stored in memory.
 
 The sprintf view formats the debug entries in the same way as the sprintf
-function would do. The sprintf event/expection fuctions write to the 
+function would do. The sprintf event/expection functions write to the
 debug entry a pointer to the format string (size = sizeof(long)) 
 and for each vararg a long value. So e.g. for a debug entry with a format 
 string plus two varargs one would need to allocate a (3 * sizeof(long)) 
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/scsi/ibmmca.txt linux-2.6.13-rc2~spelling/Documentation/scsi/ibmmca.txt
--- linux-2.6.13-rc2/Documentation/scsi/ibmmca.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/scsi/ibmmca.txt	2005-07-08 20:41:14.000000000 +0200
@@ -344,7 +344,7 @@
    /proc/scsi/ibmmca/<host_no>. ibmmca_proc_info() provides this information.
    
    This table is quite informative for interested users. It shows the load
-   of commands on the subsystem and wether you are running the bypassed 
+   of commands on the subsystem and whether you are running the bypassed
    (software) or integrated (hardware) SCSI-command set (see below). The
    amount of accesses is shown. Read, write, modeselect is shown separately
    in order to help debugging problems with CD-ROMs or tapedrives.
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/sound/alsa/ALSA-Configuration.txt linux-2.6.13-rc2~spelling/Documentation/sound/alsa/ALSA-Configuration.txt
--- linux-2.6.13-rc2/Documentation/sound/alsa/ALSA-Configuration.txt	2005-07-07 21:28:47.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/sound/alsa/ALSA-Configuration.txt	2005-07-07 23:29:28.000000000 +0200
@@ -1462,7 +1462,7 @@ devices where %i is sound card number fr
 To auto-load an ALSA driver for OSS services, define the string
 'sound-slot-%i' where %i means the slot number for OSS, which
 corresponds to the card index of ALSA.  Usually, define this
-as the the same card module.
+as the same card module.
 
 An example configuration for a single emu10k1 card is like below:
 ----- /etc/modprobe.conf
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/uml/UserModeLinux-HOWTO.txt linux-2.6.13-rc2~spelling/Documentation/uml/UserModeLinux-HOWTO.txt
--- linux-2.6.13-rc2/Documentation/uml/UserModeLinux-HOWTO.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/uml/UserModeLinux-HOWTO.txt	2005-07-07 23:29:28.000000000 +0200
@@ -2176,7 +2176,7 @@
   If you want to access files on the host machine from inside UML, you
   can treat it as a separate machine and either nfs mount directories
   from the host or copy files into the virtual machine with scp or rcp.
-  However, since UML is running on the the host, it can access those
+  However, since UML is running on the host, it can access those
   files just like any other process and make them available inside the
   virtual machine without needing to use the network.
 
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/usb/gadget_serial.txt linux-2.6.13-rc2~spelling/Documentation/usb/gadget_serial.txt
--- linux-2.6.13-rc2/Documentation/usb/gadget_serial.txt	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/usb/gadget_serial.txt	2005-07-07 23:29:28.000000000 +0200
@@ -20,7 +20,7 @@ License along with this program; if not,
 Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 MA 02111-1307 USA.
 
-This document and the the gadget serial driver itself are
+This document and the gadget serial driver itself are
 Copyright (C) 2004 by Al Borchers (alborchers@steinerpoint.com).
 
 If you have questions, problems, or suggestions for this driver
diff -urpN -X dontdiff linux-2.6.13-rc2/Documentation/video4linux/Zoran linux-2.6.13-rc2~spelling/Documentation/video4linux/Zoran
--- linux-2.6.13-rc2/Documentation/video4linux/Zoran	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc2~spelling/Documentation/video4linux/Zoran	2005-07-08 20:58:31.000000000 +0200
@@ -222,7 +222,7 @@ was introduced in 1991, is used in the D
 can generate: PAL , NTSC , SECAM
 
 The adv717x, should be able to produce PAL N. But you find nothing PAL N 
-specific in the the registers. Seem that you have to reuse a other standard
+specific in the registers. Seem that you have to reuse a other standard
 to generate PAL N, maybe it would work if you use the PAL M settings. 
 
 ==========================

--===============232524708000728==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============232524708000728==--
