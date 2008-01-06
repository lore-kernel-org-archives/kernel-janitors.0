From: Leonardo Potenza <lpotenza@inwind.it>
Date: Sun, 06 Jan 2008 15:24:22 +0000
Subject: [PATCH resubmit] drivers/video/aty/radeon_base.c: compilation warning fix
Message-Id: <200801061624.22567.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Added a check for the sysfs_create_bin_file() return value.
In case of error the framebuffer creation is not aborted, but a warning message is generated instead.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---

The aim of this patch is to remove the following warning messages:
drivers/video/aty/radeon_base.c: In function 'radeonfb_pci_register':
drivers/video/aty/radeon_base.c:2334: warning: ignoring return value of 'sysfs_create_bin_file', declared with attribute warn_unused_result
drivers/video/aty/radeon_base.c:2336: warning: ignoring return value of 'sysfs_create_bin_file', declared with attribute warn_unused_result

--- linux-2.6.orig/drivers/video/aty/radeon_base.c
+++ linux-2.6/drivers/video/aty/radeon_base.c
@@ -2331,9 +2331,9 @@ static int __devinit radeonfb_pci_regist
 
 	/* Register some sysfs stuff (should be done better) */
 	if (rinfo->mon1_EDID)
-		sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
+		WARN_ON(sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr));
 	if (rinfo->mon2_EDID)
-		sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
+		WARN_ON(sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr));
 
 	/* save current mode regs before we switch into the new one
 	 * so we can restore this upon __exit
