From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Mon, 01 Oct 2012 16:57:44 +0000
Subject: How to automatically get subsystem name for a file?
Message-Id: <CA+MoWDrjiGQtBdr_n5TEwDJDv4pDyitKqHmruCy7-ur0GwKp0w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

I'm trying to figure it out how to automatically get the correct
subsystem string for putting on the first line of the commit message /
subject of the patch message. For example:

Subject: [PATCH 001/142] arch/x86: Replace memcpy with struct assignment
                                       ^^^^^^^^^^
arch/x86 is only the first two levels of directories from Kernel
source. This may not be smart enough...

What should be the subsystem for the files:

arch/x86/kernel/e820.c
drivers/acpi/thermal.c
drivers/atm/idt77105.c
drivers/block/xen-blkfront.c
drivers/media/dvb-core/dvb_frontend.c
drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
drivers/misc/phantom.c
drivers/misc/sgi-gru/grufault.c
drivers/net/usb/hso.c
drivers/net/wireless/at76c50x-usb.c
drivers/scsi/ncr53c8xx.c
drivers/sh/intc/core.c
drivers/staging/iio/light/tsl2x7x_core.c
fs/btrfs/tree-defrag.c
fs/cifs/connect.c
fs/devpts/inode.c
net/bridge/netfilter/ebtables.c
net/ceph/auth_x.c
net/rds/ib_send.c
sound/pci/bt87x.c
sound/soc/codecs/wm8994.c
sound/usb/caiaq/audio.c

get_maintainers.pl helps but not a lot. Here is it's output for the files above:

arch/x86/kernel/e820.c:X86 ARCHITECTURE (32-BIT AND 64-BIT)
drivers/acpi/thermal.c:ACPI THERMAL DRIVER
drivers/atm/idt77105.c:ATM
drivers/block/xen-blkfront.c:XEN HYPERVISOR INTERFACE
drivers/media/dvb-core/dvb_frontend.c:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:PVRUSB2 VIDEO4LINUX DRIVER
drivers/misc/phantom.c:SENSABLE PHANTOM
drivers/misc/sgi-gru/grufault.c:SGI GRU DRIVER
drivers/net/usb/hso.c:HSO 3G MODEM DRIVER
drivers/net/wireless/at76c50x-usb.c:NETWORKING [WIRELESS]
drivers/scsi/ncr53c8xx.c:SCSI SUBSYSTEM
drivers/sh/intc/core.c:ARM/SHMOBILE ARM ARCHITECTURE
drivers/staging/iio/light/tsl2x7x_core.c:STAGING - INDUSTRIAL IO
fs/btrfs/tree-defrag.c:BTRFS FILE SYSTEM
fs/cifs/connect.c:COMMON INTERNET FILE SYSTEM (CIFS)
fs/devpts/inode.c:THE REST
net/bridge/netfilter/ebtables.c:EBTABLES
net/ceph/auth_x.c:CEPH DISTRIBUTED FILE SYSTEM CLIENT
net/rds/ib_send.c:RDS - RELIABLE DATAGRAM SOCKETS
sound/pci/bt87x.c:BT87X AUDIO DRIVER
sound/soc/codecs/wm8994.c:WOLFSON MICROELECTRONICS DRIVERS
sound/usb/caiaq/audio.c:NATIVE INSTRUMENTS USB SOUND INTERFACE DRIVER

Subject: [PATCH] NATIVE INSTRUMENTS USB SOUND INTERFACE DRIVER:
Replace memcpy with struct assignment

Do not look as good option too. It is possible to use full path of the
file but leads to Subject over 80 chars.

Any ideas?






-- 
Peter
