From: carlos neira <cneira@srb.cl>
Date: Mon, 09 Jan 2006 11:38:03 +0000
Subject: [KJ] linux-2.6.15-rc7/drivers/pci/syscall.c
Message-Id: <200601091138.03704.cneira@srb.cl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_bskwDaEmBGNUP0M"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--Boundary-00=_bskwDaEmBGNUP0M
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Greetings :

patch :linux-2.6.15-rc7/drivers/pci/syscall.c

replaced a  lock_kernel with spinlocks  , compile tested ok






-- 
"Employ your time in improving yourself by other men's writings, so that you 
shall gain easily what others have labored hard for."
Socrates

--Boundary-00=_bskwDaEmBGNUP0M
Content-Type: text/x-diff;
  charset="us-ascii";
  name="syscall.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="syscall.patch"

diff -urN /usr/src/linux-2.6.15-rc7/drivers/pci/syscall.c /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/syscall.c
--- /usr/src/linux-2.6.15-rc7/drivers/pci/syscall.c	2005-12-24 20:47:48.000000000 -0300
+++ /home/cneira/Linuxjanitoring/linux-janitorpatching/drivers/pci/syscall.c	2006-01-07 22:53:23.000000000 -0300
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/pci.h>
 #include <linux/smp_lock.h>
+#include <linux/spinlock.h>
 #include <linux/syscalls.h>
 #include <asm/uaccess.h>
 #include "pci.h"
@@ -21,6 +22,7 @@
 		   void __user *buf)
 {
 	struct pci_dev *dev;
+
 	u8 byte;
 	u16 word;
 	u32 dword;
@@ -35,7 +37,7 @@
 	if (!dev)
 		goto error;
 
-	lock_kernel();
+	spin_lock(&pciconfig_read_lock)
 	switch (len) {
 	case 1:
 		cfg_ret = pci_user_read_config_byte(dev, off, &byte);
@@ -48,10 +50,10 @@
 		break;
 	default:
 		err = -EINVAL;
-		unlock_kernel();
+		spin_unlock(&pciconfig_read_lock);
 		goto error;
 	};
-	unlock_kernel();
+	spin_unlock(&pciconfig_read_lock);
 
 	err = -EIO;
 	if (cfg_ret != PCIBIOS_SUCCESSFUL)
@@ -106,7 +108,7 @@
 	if (!dev)
 		return -ENODEV;
 
-	lock_kernel();
+	spin_lock(&pciconfig_write_lock)
 	switch(len) {
 	case 1:
 		err = get_user(byte, (u8 __user *)buf);
@@ -139,7 +141,7 @@
 		err = -EINVAL;
 		break;
 	};
-	unlock_kernel();
+	spin_unlock(&pciconfig_write_lock)
 
 	return err;
 }

--Boundary-00=_bskwDaEmBGNUP0M
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_bskwDaEmBGNUP0M--
