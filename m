From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sun, 04 Dec 2005 00:17:28 +0000
Subject: [KJ] [PATCH 8/21] polling loops: change exit condition to
Message-Id: <43923598.1020201@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

INFINIBAND SUBSYSTEM
P:	Roland Dreier
M:	rolandd@cisco.com
P:	Sean Hefty
M:	mshefty@ichips.intel.com
P:	Hal Rosenstock
M:	halr@voltaire.com

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
diff -upr -X linux-2.6.15-rc4/Documentation/dontdiff linux-2.6.15-rc4-orig/drivers/infiniband/hw/mthca/mthca_reset.c linux-2.6.15-rc4/drivers/infiniband/hw/mthca/mthca_reset.c
--- linux-2.6.15-rc4-orig/drivers/infiniband/hw/mthca/mthca_reset.c	2005-12-03 15:22:32.000000000 +0100
+++ linux-2.6.15-rc4/drivers/infiniband/hw/mthca/mthca_reset.c	2005-12-03 16:53:10.000000000 +0100
@@ -153,9 +153,10 @@ int mthca_reset(struct mthca_dev *mdev)
 	/* Now wait for PCI device to start responding again */
 	{
 		u32 v;
-		int c = 0;
+		unsigned long end_time;
 
-		for (c = 0; c < 100; ++c) {
+		end_time = jiffies + msecs_to_jiffies(10000);
+		while (time_before(jiffies, end_time)) {
 			if (pci_read_config_dword(bridge ? bridge : mdev->pdev, 0, &v)) {
 				err = -ENODEV;
 				mthca_err(mdev, "Couldn't access HCA after reset, "
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
