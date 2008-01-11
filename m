From: Sergio Luis <sergio@uece.br>
Date: Fri, 11 Jan 2008 03:26:06 +0000
Subject: [PATCH 1/1] PCI: change procfs interface to use unlocked_ioctl instead
Message-Id: <4786E1CE.4080404@uece.br>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-kernel@vger.kernel.org, linux-pci@atrey.karlin.mff.cuni.cz
Cc: kernel-janitors@vger.kernel.org

Change drivers/pci/proc.c to use the unlocked_ioctl handler instead of
the ioctl one.

Signed-off-by: Sergio Luis <sergio@uece.br>

 proc.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)


diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index 716439e..8ac5880 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -12,6 +12,7 @@
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
 #include <linux/capability.h>
+#include <linux/smp_lock.h>
 #include <asm/uaccess.h>
 #include <asm/byteorder.h>
 #include "pci.h"
@@ -202,15 +203,17 @@ struct pci_filp_private {
     int write_combine;
 };
 
-static int proc_bus_pci_ioctl(struct inode *inode, struct file *file, 
unsigned int cmd, unsigned long arg)
+static long proc_bus_pci_ioctl(struct file *file, unsigned int cmd, 
unsigned long arg)
 {
+    struct inode *inode = file->f_path.dentry->d_inode;
     const struct proc_dir_entry *dp = PDE(inode);
     struct pci_dev *dev = dp->data;
 #ifdef HAVE_PCI_MMAP
     struct pci_filp_private *fpriv = file->private_data;
 #endif /* HAVE_PCI_MMAP */
-    int ret = 0;
+    long ret = 0;
 
+    lock_kernel();
     switch (cmd) {
     case PCIIOC_CONTROLLER:
         ret = pci_domain_nr(dev->bus);
@@ -239,6 +242,7 @@ static int proc_bus_pci_ioctl(struct inode *inode, 
struct file *file, unsigned i
         break;
     };
 
+    unlock_kernel();
     return ret;
 }
 
@@ -291,7 +295,7 @@ static const struct file_operations 
proc_bus_pci_operations = {
     .llseek        = proc_bus_pci_lseek,
     .read        = proc_bus_pci_read,
     .write        = proc_bus_pci_write,
-    .ioctl        = proc_bus_pci_ioctl,
+    .unlocked_ioctl    = proc_bus_pci_ioctl,
 #ifdef HAVE_PCI_MMAP
     .open        = proc_bus_pci_open,
     .release    = proc_bus_pci_release,


