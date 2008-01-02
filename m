From: Leonardo Potenza <lpotenza@inwind.it>
Date: Wed, 02 Jan 2008 18:01:44 +0000
Subject: [PATCH] drivers/video/aty/radeon_base.c: compilation warning fix
Message-Id: <200801021901.44226.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Added a check for the sysfs_create_bin_file() return value

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---

The aim of this patch is to remove the following warning messages:
drivers/video/aty/radeon_base.c: In function 'radeonfb_pci_register':
drivers/video/aty/radeon_base.c:2334: warning: ignoring return value of 'sysfs_create_bin_file', declared with attribute warn_unused_result
drivers/video/aty/radeon_base.c:2336: warning: ignoring return value of 'sysfs_create_bin_file', declared with attribute warn_unused_result

--- linux-2.6.orig/drivers/video/aty/radeon_base.c
+++ linux-2.6/drivers/video/aty/radeon_base.c
@@ -2329,11 +2329,23 @@ static int __devinit radeonfb_pci_regist
 	/* Build mode list, check out panel native model */
 	radeon_check_modes(rinfo, mode_option);
 
-	/* Register some sysfs stuff (should be done better) */
-	if (rinfo->mon1_EDID)
-		sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
-	if (rinfo->mon2_EDID)
-		sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
+	/* Register some sysfs stuff */
+	if (rinfo->mon1_EDID) {
+		ret = sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
+		if (ret != 0) {
+			printk( KERN_ERR "radeonfb (%s): cannot create edid1 bin file\n",
+				pci_name(rinfo->pdev));
+			goto err_unmap_fb;
+		}
+	}
+	if (rinfo->mon2_EDID) {
+		ret = sysfs_create_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
+		if (ret != 0) {
+			printk( KERN_ERR "radeonfb (%s): cannot create edid2 bin file\n",
+				pci_name(rinfo->pdev));
+			goto err_remove_edid1_file;
+		}
+	}
 
 	/* save current mode regs before we switch into the new one
 	 * so we can restore this upon __exit
@@ -2357,7 +2369,7 @@ static int __devinit radeonfb_pci_regist
 	if (ret < 0) {
 		printk (KERN_ERR "radeonfb (%s): could not register framebuffer\n",
 			pci_name(rinfo->pdev));
-		goto err_unmap_fb;
+		goto err_remove_edid2_file;
 	}
 
 #ifdef CONFIG_MTRR
@@ -2376,6 +2388,12 @@ static int __devinit radeonfb_pci_regist
 	RTRACE("radeonfb_pci_register END\n");
 
 	return 0;
+err_remove_edid2_file:
+	if (rinfo->mon2_EDID)
+		sysfs_remove_bin_file(&rinfo->pdev->dev.kobj, &edid2_attr);
+err_remove_edid1_file:
+	if (rinfo->mon1_EDID)
+		sysfs_remove_bin_file(&rinfo->pdev->dev.kobj, &edid1_attr);
 err_unmap_fb:
 	iounmap(rinfo->fb_base);
 err_unmap_rom:
