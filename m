From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 19 Jul 2007 19:05:32 +0000
Subject: Re: [PATCH] Remove BKL from PCI syscalls
Message-Id: <20070719190532.GV14791@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710165532.GP9704@parisc-linux.org>
In-Reply-To: <20070710165532.GP9704@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 10, 2007 at 04:49:36PM -0700, Greg KH wrote:
> How about just doing your patch on top of Alan's instead?

Now that Alan's patch is in Linus' tree, here's an update of my patch:

----

Remove use of the BKL from the PCI syscalls since it no longer serves
any purpose.  It used to protect against PCI device removal, but now we
have a reference to the device, we no longer need that protection.

While I'm in this file, update the comment at the top to reflect the
status of the syscalls.

Signed-off-by: Matthew Wilcox <matthew@wil.cx>

diff --git a/drivers/pci/syscall.c b/drivers/pci/syscall.c
index 2ac050d..0934760 100644
--- a/drivers/pci/syscall.c
+++ b/drivers/pci/syscall.c
@@ -1,10 +1,13 @@
 /*
  *	pci_syscall.c
  *
- * For architectures where we want to allow direct access
- * to the PCI config stuff - it would probably be preferable
- * on PCs too, but there people just do it by hand with the
- * magic northbridge registers..
+ * This is a legacy method for accessing PCI config space on some
+ * architectures.  These days, everybody should be using sysfs or procfs
+ * which allow non-privileged users to read the safe bits of config space,
+ * but we can't remove these syscalls.  These syscalls do not allow access
+ * to PCI domains other than zero, and while it would be possible to add
+ * that support, it is better to migrate any userspace application to use
+ * the sysfs method.
  */
 
 #include <linux/errno.h>
@@ -23,18 +26,15 @@ sys_pciconfig_read(unsigned long bus, unsigned long dfn,
 	u8 byte;
 	u16 word;
 	u32 dword;
-	long err;
-	long cfg_ret;
+	long err, cfg_ret;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	err = -ENODEV;
-	dev = pci_get_bus_and_slot(bus, dfn);
+	dev = pci_get_slot(pci_find_bus(0, bus), dfn);
 	if (!dev)
-		goto error;
+		return -ENODEV;
 
-	lock_kernel();
 	switch (len) {
 	case 1:
 		cfg_ret = pci_user_read_config_byte(dev, off, &byte);
@@ -47,10 +47,8 @@ sys_pciconfig_read(unsigned long bus, unsigned long dfn,
 		break;
 	default:
 		err = -EINVAL;
-		unlock_kernel();
 		goto error;
-	};
-	unlock_kernel();
+	}
 
 	err = -EIO;
 	if (cfg_ret != PCIBIOS_SUCCESSFUL)
@@ -67,10 +65,10 @@ sys_pciconfig_read(unsigned long bus, unsigned long dfn,
 		err = put_user(dword, (unsigned int __user *)buf);
 		break;
 	}
-	pci_dev_put(dev);
-	return err;
 
-error:
+	goto out;
+
+ error:
 	/* ??? XFree86 doesn't even check the return value.  They
 	   just look for 0xffffffff in the output, since that's what
 	   they get instead of a machine check on x86.  */
@@ -85,6 +83,7 @@ error:
 		put_user(-1, (unsigned int __user *)buf);
 		break;
 	}
+ out:
 	pci_dev_put(dev);
 	return err;
 }
@@ -103,11 +102,10 @@ sys_pciconfig_write(unsigned long bus, unsigned long dfn,
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	dev = pci_get_bus_and_slot(bus, dfn);
+	dev = pci_get_slot(pci_find_bus(0, bus), dfn);
 	if (!dev)
 		return -ENODEV;
 
-	lock_kernel();
 	switch(len) {
 	case 1:
 		err = get_user(byte, (u8 __user *)buf);
@@ -140,7 +138,7 @@ sys_pciconfig_write(unsigned long bus, unsigned long dfn,
 		err = -EINVAL;
 		break;
 	}
-	unlock_kernel();
+
 	pci_dev_put(dev);
 	return err;
 }

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
