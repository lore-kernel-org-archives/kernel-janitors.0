From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Mon, 28 Sep 2009 23:49:00 +0000
Subject: [PATCH] staging/p9auth:  adding __init/__exit macros
Message-Id: <200909290149.01257.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: "Serge E. Hallyn" <serue@us.ibm.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, Jiri Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init/__exit macros to the module_init/
module_exit functions of drivers/staging/p9auth/p9auth.c

Greg, please have a look at the small patch and either pull it through
your staging tree, or please ack' it so Jiri can pull it through the trivial tree.

linux version v2.6.32-rc1 - linus git tree, Di 29. Sep 01:10:18 CEST 2009

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
diff --git a/drivers/staging/p9auth/p9auth.c b/drivers/staging/p9auth/p9auth.c
index 9111dcb..c64ace0 100644
--- a/drivers/staging/p9auth/p9auth.c
+++ b/drivers/staging/p9auth/p9auth.c
@@ -332,6 +332,7 @@ static const struct file_operations cap_fops = {
 	.release = cap_release,
 };
 
+/* no __exit here because it can be called by the init function */
 static void cap_cleanup_module(void)
 {
 	int i;
@@ -358,7 +359,7 @@ static void cap_setup_cdev(struct cap_dev *dev, int index)
 		printk(KERN_NOTICE "Error %d adding cap%d", err, index);
 }
 
-static int cap_init_module(void)
+static int __init cap_init_module(void)
 {
 	int result, i;
 	dev_t dev = 0;
