From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 19 Aug 2005 20:56:32 +0000
Subject: [KJ] [PATCH] mtd: remove compatmac.h
Message-Id: <20050819205632.GA5211@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10496448015635007=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10496448015635007==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

File is effectively empty.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/mtd/chips/cfi_cmdset_0001.c |    1 -
 drivers/mtd/chips/cfi_cmdset_0002.c |    1 -
 drivers/mtd/chips/cfi_cmdset_0020.c |    2 --
 drivers/mtd/chips/cfi_util.c        |    1 -
 drivers/mtd/chips/chipreg.c         |    1 -
 drivers/mtd/chips/jedec.c           |    1 -
 drivers/mtd/chips/map_absent.c      |    1 -
 drivers/mtd/chips/map_ram.c         |    2 --
 drivers/mtd/chips/map_rom.c         |    1 -
 drivers/mtd/devices/docecc.c        |    1 -
 drivers/mtd/devices/docprobe.c      |    1 -
 drivers/mtd/devices/mtdram.c        |    1 -
 drivers/mtd/devices/pmc551.c        |    1 -
 drivers/mtd/inftlmount.c            |    1 -
 drivers/mtd/mtdchar.c               |    1 -
 drivers/mtd/mtdcore.c               |    1 -
 drivers/mtd/mtdpart.c               |    1 -
 drivers/mtd/nand/diskonchip.c       |    1 -
 drivers/mtd/nand/nand_base.c        |    1 -
 drivers/mtd/nand/nand_bbt.c         |    1 -
 drivers/mtd/nand/rtc_from4.c        |    1 -
 fs/jffs2/nodelist.h                 |    1 -
 include/linux/mtd/compatmac.h       |   10 ----------
 include/linux/mtd/map.h             |    1 -
 include/linux/mtd/mtd.h             |    1 -
 25 files changed, 36 deletions(-)

--- linux-vanilla/drivers/mtd/chips/cfi_cmdset_0001.c
+++ linux-compatmac/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -33,7 +33,6 @@
 #include <linux/mtd/xip.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/compatmac.h>
 #include <linux/mtd/cfi.h>
 
 /* #define CMDSET0001_DISABLE_ERASE_SUSPEND_ON_WRITE */
--- linux-vanilla/drivers/mtd/chips/cfi_cmdset_0002.c
+++ linux-compatmac/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -34,7 +34,6 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/mtd/compatmac.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/cfi.h>
--- linux-vanilla/drivers/mtd/chips/cfi_cmdset_0020.c
+++ linux-compatmac/drivers/mtd/chips/cfi_cmdset_0020.c
@@ -36,8 +36,6 @@
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/compatmac.h>
-
 
 static int cfi_staa_read(struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_staa_write_buffers(struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
--- linux-vanilla/drivers/mtd/chips/cfi_util.c
+++ linux-compatmac/drivers/mtd/chips/cfi_util.c
@@ -26,7 +26,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/cfi.h>
-#include <linux/mtd/compatmac.h>
 
 struct cfi_extquery *
 __xipram cfi_read_pri(struct map_info *map, __u16 adr, __u16 size, const char* name)
--- linux-vanilla/drivers/mtd/chips/chipreg.c
+++ linux-compatmac/drivers/mtd/chips/chipreg.c
@@ -13,7 +13,6 @@
 #include <linux/slab.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/compatmac.h>
 
 static DEFINE_SPINLOCK(chip_drvs_lock);
 static LIST_HEAD(chip_drvs_list);
--- linux-vanilla/drivers/mtd/chips/jedec.c
+++ linux-compatmac/drivers/mtd/chips/jedec.c
@@ -20,7 +20,6 @@
 #include <linux/mtd/jedec.h>
 #include <linux/mtd/map.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/compatmac.h>
 
 static struct mtd_info *jedec_probe(struct map_info *);
 static int jedec_probe8(struct map_info *map,unsigned long base,
--- linux-vanilla/drivers/mtd/chips/map_absent.c
+++ linux-compatmac/drivers/mtd/chips/map_absent.c
@@ -26,7 +26,6 @@
 #include <linux/init.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
-#include <linux/mtd/compatmac.h>
 
 static int map_absent_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int map_absent_write (struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
--- linux-vanilla/drivers/mtd/chips/map_ram.c
+++ linux-compatmac/drivers/mtd/chips/map_ram.c
@@ -14,8 +14,6 @@
 #include <linux/init.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
-#include <linux/mtd/compatmac.h>
-
 
 static int mapram_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int mapram_write (struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
--- linux-vanilla/drivers/mtd/chips/map_rom.c
+++ linux-compatmac/drivers/mtd/chips/map_rom.c
@@ -14,7 +14,6 @@
 #include <linux/init.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/map.h>
-#include <linux/mtd/compatmac.h>
 
 static int maprom_read (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int maprom_write (struct mtd_info *, loff_t, size_t, size_t *, const u_char *);
--- linux-vanilla/drivers/mtd/devices/docecc.c
+++ linux-compatmac/drivers/mtd/devices/docecc.c
@@ -36,7 +36,6 @@
 #include <linux/init.h>
 #include <linux/types.h>
 
-#include <linux/mtd/compatmac.h> /* for min() in older kernels */
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/doc2000.h>
 
--- linux-vanilla/drivers/mtd/devices/docprobe.c
+++ linux-compatmac/drivers/mtd/devices/docprobe.c
@@ -53,7 +53,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/doc2000.h>
-#include <linux/mtd/compatmac.h>
 
 /* Where to look for the devices? */
 #ifndef CONFIG_MTD_DOCPROBE_ADDRESS
--- linux-vanilla/drivers/mtd/devices/mtdram.c
+++ linux-compatmac/drivers/mtd/devices/mtdram.c
@@ -16,7 +16,6 @@
 #include <linux/ioport.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
-#include <linux/mtd/compatmac.h>
 #include <linux/mtd/mtd.h>
 
 static unsigned long total_size = CONFIG_MTDRAM_TOTAL_SIZE;
--- linux-vanilla/drivers/mtd/devices/pmc551.c
+++ linux-compatmac/drivers/mtd/devices/pmc551.c
@@ -107,7 +107,6 @@
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/pmc551.h>
-#include <linux/mtd/compatmac.h>
 
 static struct mtd_info *pmc551list;
 
--- linux-vanilla/drivers/mtd/inftlmount.c
+++ linux-compatmac/drivers/mtd/inftlmount.c
@@ -39,7 +39,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nftl.h>
 #include <linux/mtd/inftl.h>
-#include <linux/mtd/compatmac.h>
 
 char inftlmountrev[]="$Revision: 1.16 $";
 
--- linux-vanilla/drivers/mtd/mtdchar.c
+++ linux-compatmac/drivers/mtd/mtdchar.c
@@ -9,7 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/compatmac.h>
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/fs.h>
--- linux-vanilla/drivers/mtd/mtdcore.c
+++ linux-compatmac/drivers/mtd/mtdcore.c
@@ -18,7 +18,6 @@
 #include <linux/fs.h>
 #include <linux/ioctl.h>
 #include <linux/init.h>
-#include <linux/mtd/compatmac.h>
 #ifdef CONFIG_PROC_FS
 #include <linux/proc_fs.h>
 #endif
--- linux-vanilla/drivers/mtd/mtdpart.c
+++ linux-compatmac/drivers/mtd/mtdpart.c
@@ -20,7 +20,6 @@
 #include <linux/kmod.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/compatmac.h>
 
 /* Our partition linked list */
 static LIST_HEAD(mtd_partitions);
--- linux-vanilla/drivers/mtd/nand/diskonchip.c
+++ linux-compatmac/drivers/mtd/nand/diskonchip.c
@@ -30,7 +30,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/doc2000.h>
-#include <linux/mtd/compatmac.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/inftl.h>
 
--- linux-vanilla/drivers/mtd/nand/nand_base.c
+++ linux-compatmac/drivers/mtd/nand/nand_base.c
@@ -75,7 +75,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
-#include <linux/mtd/compatmac.h>
 #include <linux/interrupt.h>
 #include <linux/bitops.h>
 #include <asm/io.h>
--- linux-vanilla/drivers/mtd/nand/nand_bbt.c
+++ linux-compatmac/drivers/mtd/nand/nand_bbt.c
@@ -57,7 +57,6 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
-#include <linux/mtd/compatmac.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 
--- linux-vanilla/drivers/mtd/nand/rtc_from4.c
+++ linux-compatmac/drivers/mtd/nand/rtc_from4.c
@@ -25,7 +25,6 @@
 #include <linux/slab.h>
 #include <linux/rslib.h>
 #include <linux/module.h>
-#include <linux/mtd/compatmac.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/partitions.h>
--- linux-vanilla/fs/jffs2/nodelist.h
+++ linux-compatmac/fs/jffs2/nodelist.h
@@ -24,7 +24,6 @@
 #ifdef __ECOS
 #include "os-ecos.h"
 #else
-#include <linux/mtd/compatmac.h> /* For min/max in older kernels */
 #include "os-linux.h"
 #endif
 
--- linux-vanilla/include/linux/mtd/compatmac.h	2005-08-19 15:17:20.000000000 +0400
+++ linux-compatmac/include/linux/mtd/compatmac.h	1970-01-01 03:00:00.000000000 +0300
@@ -1,10 +0,0 @@
-
-#ifndef __LINUX_MTD_COMPATMAC_H__
-#define __LINUX_MTD_COMPATMAC_H__
-
-/* Nothing to see here. We write 2.5-compatible code and this
-   file makes it all OK in older kernels, but it's empty in _current_
-   kernels. Include guard just to make GCC ignore it in future inclusions
-   anyway... */
-
-#endif /* __LINUX_MTD_COMPATMAC_H__ */
--- linux-vanilla/include/linux/mtd/map.h
+++ linux-compatmac/include/linux/mtd/map.h
@@ -8,7 +8,6 @@
 #include <linux/config.h>
 #include <linux/types.h>
 #include <linux/list.h>
-#include <linux/mtd/compatmac.h>
 #include <asm/unaligned.h>
 #include <asm/system.h>
 #include <asm/io.h>
--- linux-vanilla/include/linux/mtd/mtd.h
+++ linux-compatmac/include/linux/mtd/mtd.h
@@ -20,7 +20,6 @@
 #include <linux/uio.h>
 #include <linux/notifier.h>
 
-#include <linux/mtd/compatmac.h>
 #include <mtd/mtd-abi.h>
 
 #define MTD_CHAR_MAJOR 90


--===============10496448015635007==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10496448015635007==--
