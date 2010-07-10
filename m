From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 10 Jul 2010 03:56:52 +0000
Subject: [PATCH 3/3] fix staging/spectra: don't use locked_ioctl
Message-Id: <1278734212.1725.48.camel@lenovo>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Since BKL was removed from block ioctl handling code, locked_ioctl doesn't 
exist anymore. 

Using ioctl instead and doing the locking manually.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 drivers/staging/spectra/ffsport.c |   15 ++++++++++++++-
 1 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/spectra/ffsport.c b/drivers/staging/spectra/ffsport.c
index 00a0ac0..6f73091 100644
--- a/drivers/staging/spectra/ffsport.c
+++ b/drivers/staging/spectra/ffsport.c
@@ -27,6 +27,7 @@
 #include <linux/kthread.h>
 #include <linux/log2.h>
 #include <linux/init.h>
+#include <linux/smp_lock.h>
 
 /**** Helper functions used for Div, Remainder operation on u64 ****/
 
@@ -589,11 +590,23 @@ int GLOB_SBD_ioctl(struct block_device *bdev, fmode_t mode,
 	return -ENOTTY;
 }
 
+int GLOB_SBD_unlocked_ioctl(struct block_device *bdev, fmode_t mode,
+		unsigned int cmd, unsigned long arg)
+{
+	int ret;
+
+	lock_kernel();
+	ret = GLOB_SBD_ioctl(bdev, mode, cmd, arg);
+	unlock_kernel();
+	
+	return ret;
+}
+
 static struct block_device_operations GLOB_SBD_ops = {
 	.owner = THIS_MODULE,
 	.open = GLOB_SBD_open,
 	.release = GLOB_SBD_release,
-	.locked_ioctl = GLOB_SBD_ioctl,
+	.ioctl = GLOB_SBD_unlocked_ioctl,
 	.getgeo = GLOB_SBD_getgeo,
 };
 
-- 
1.7.0.4



