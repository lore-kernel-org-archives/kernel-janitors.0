From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 03 Dec 2007 11:15:31 +0000
Subject: [PATCH] Clarify the BLK_DEV_INITRD Kconfig help info.
Message-Id: <alpine.LFD.0.9999.0712030613180.22347@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

the current Kconfig help info for BLK_DEV_INITRD is really quite
inadequate and misleading.

diff --git a/init/Kconfig b/init/Kconfig
index d35e44f..f6a68fd 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -394,15 +394,24 @@ config BLK_DEV_INITRD
 	bool "Initial RAM filesystem and RAM disk (initramfs/initrd) support"
 	depends on BROKEN || !FRV
 	help
-	  The initial RAM filesystem is a ramfs which is loaded by the
-	  boot loader (loadlin or lilo) and that is mounted as root
-	  before the normal boot procedure. It is typically used to
-	  load modules needed to mount the "real" root file system,
-	  etc. See <file:Documentation/initrd.txt> for details.
-
-	  If RAM disk support (BLK_DEV_RAM) is also included, this
-	  also enables initial RAM disk (initrd) support and adds
-	  15 Kbytes (more on some other architectures) to the kernel size.
+	  The initial RAM filesystem (or "initrd" for short) is a ramfs
+	  which is loaded early in the boot process, and is typically used
+	  to load modules that are needed to later mount the "real" root
+	  filesystem.  (See the file Documentation/initrd.txt for details.)
+
+	  Once you enable this option, you can supply an initrd via one of
+	  two locations:
+
+	  1) an "in-kernel" compressed cpio-format filesystem, or
+	  2) supplied by a boot loader (say, LILO or GRUB), where that
+	     external filesystem can have one of a number of formats such
+	     as compressed cpio, ext2, etc.
+
+	  *Note* that selecting this option for early initrd support has
+	  nothing to do with RAM disk support selected by the BLK_DEV_RAM
+	  option in drivers/block/Kconfig, which gives you RAM disk support
+	  *after* the system has finished booting.  These are two entirely
+	  independent configuration options.

 	  If unsure say Y.

====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
