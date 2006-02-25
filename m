From: Tim Cooijmans <tim@aapopfiets.nl>
Date: Sat, 25 Feb 2006 13:58:20 +0000
Subject: [KJ] [PATCH] check request_region return value
Message-Id: <200602251458.21105.tim@aapopfiets.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602242249.22568.tim@aapopfiets.nl>
In-Reply-To: <200602242249.22568.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Tim Cooijmans <tim@aapopfiets.nl>

Check request_region return value in drivers/acpi/motherboard.c.  
acpi_reserve_resources now returns int, 0 being success.  
acpi_motherboard_init propagates that return value.

Passed compilation.

Signed-off-by: Tim Cooijmans <tim@aapopfiets.nl>
---
--- linux-2.6.16-rc4-orig/drivers/acpi/motherboard.c	2006-02-21 
20:18:41.000000000 +0100
+++ linux-2.6.16-rc4/drivers/acpi/motherboard.c	2006-02-25 14:08:01.000000000 
+0100
@@ -123,42 +123,115 @@ static struct acpi_driver acpi_motherboa
 		},
 };
 
-static void __init acpi_reserve_resources(void)
+static int __init acpi_reserve_resources(void)
 {
 	if (acpi_gbl_FADT->xpm1a_evt_blk.address && acpi_gbl_FADT->pm1_evt_len)
-		request_region(acpi_gbl_FADT->xpm1a_evt_blk.address,
-			       acpi_gbl_FADT->pm1_evt_len, "PM1a_EVT_BLK");
+		if (request_region(acpi_gbl_FADT->xpm1a_evt_blk.address,
+				   acpi_gbl_FADT->pm1_evt_len,
+				   "PM1a_EVT_BLK") = NULL) {
+			printk(KERN_WARNING "acpi_reserve_resources: could not"
+					    "allocate PM1a_EVT_BLK region\n");
+			goto out_pm1a_evt_blk;
+		}
 
 	if (acpi_gbl_FADT->xpm1b_evt_blk.address && acpi_gbl_FADT->pm1_evt_len)
-		request_region(acpi_gbl_FADT->xpm1b_evt_blk.address,
-			       acpi_gbl_FADT->pm1_evt_len, "PM1b_EVT_BLK");
+		if (request_region(acpi_gbl_FADT->xpm1b_evt_blk.address,
+				   acpi_gbl_FADT->pm1_evt_len,
+				   "PM1b_EVT_BLK") = NULL) {
+			printk(KERN_WARNING "acpi_reserve_resources: could not"
+					    "allocate PM1b_EVT_BLK region\n");
+			goto out_pm1b_evt_blk;
+		}
 
 	if (acpi_gbl_FADT->xpm1a_cnt_blk.address && acpi_gbl_FADT->pm1_cnt_len)
-		request_region(acpi_gbl_FADT->xpm1a_cnt_blk.address,
-			       acpi_gbl_FADT->pm1_cnt_len, "PM1a_CNT_BLK");
+		if (request_region(acpi_gbl_FADT->xpm1a_cnt_blk.address,
+				   acpi_gbl_FADT->pm1_cnt_len,
+				   "PM1a_CNT_BLK") = NULL) {
+			printk(KERN_WARNING "acpi_reserve_resources: could not"
+					    "allocate PM1a_CNT_BLK region\n");
+			goto out_pm1a_cnt_blk;
+		}
 
 	if (acpi_gbl_FADT->xpm1b_cnt_blk.address && acpi_gbl_FADT->pm1_cnt_len)
-		request_region(acpi_gbl_FADT->xpm1b_cnt_blk.address,
-			       acpi_gbl_FADT->pm1_cnt_len, "PM1b_CNT_BLK");
+		if (request_region(acpi_gbl_FADT->xpm1b_cnt_blk.address,
+				   acpi_gbl_FADT->pm1_cnt_len,
+				   "PM1b_CNT_BLK") = NULL) {
+			printk(KERN_WARNING "acpi_reserve_resources: could not"
+					    "allocate PM1b_CNT_BLK region\n");
+			goto out_pm1b_cnt_blk;
+		}
 
 	if (acpi_gbl_FADT->xpm_tmr_blk.address && acpi_gbl_FADT->pm_tm_len = 4)
-		request_region(acpi_gbl_FADT->xpm_tmr_blk.address, 4, "PM_TMR");
+		if (request_region(acpi_gbl_FADT->xpm_tmr_blk.address, 4,
+				   "PM_TMR") = NULL) {
+			printk(KERN_WARNING "acpi_reserve_resources: could not"
+					    "allocate PM_TMR region\n");
+			goto out_pm_tmr;
+		}
 
 	if (acpi_gbl_FADT->xpm2_cnt_blk.address && acpi_gbl_FADT->pm2_cnt_len)
-		request_region(acpi_gbl_FADT->xpm2_cnt_blk.address,
-			       acpi_gbl_FADT->pm2_cnt_len, "PM2_CNT_BLK");
+		if (request_region(acpi_gbl_FADT->xpm2_cnt_blk.address,
+				   acpi_gbl_FADT->pm2_cnt_len,
+				   "PM2_CNT_BLK") = NULL) {
+			printk(KERN_WARNING "acpi_reserve_resources: could not"
+					    "allocate PM2_CNT_BLK region\n");
+			goto out_pm2_cnt_blk;
+		}
 
 	/* Length of GPE blocks must be a non-negative multiple of 2 */
 
 	if (acpi_gbl_FADT->xgpe0_blk.address && acpi_gbl_FADT->gpe0_blk_len &&
 	    !(acpi_gbl_FADT->gpe0_blk_len & 0x1))
-		request_region(acpi_gbl_FADT->xgpe0_blk.address,
-			       acpi_gbl_FADT->gpe0_blk_len, "GPE0_BLK");
+		if (request_region(acpi_gbl_FADT->xgpe0_blk.address,
+				   acpi_gbl_FADT->gpe0_blk_len,
+				   "GPE0_BLK") = NULL) {
+			printk(KERN_WARNING "acpi_reserve_resources: could not"
+					    "allocate GPE0_BLK region\n");
+			goto out_gpe0_blk;
+		}
 
 	if (acpi_gbl_FADT->xgpe1_blk.address && acpi_gbl_FADT->gpe1_blk_len &&
 	    !(acpi_gbl_FADT->gpe1_blk_len & 0x1))
-		request_region(acpi_gbl_FADT->xgpe1_blk.address,
-			       acpi_gbl_FADT->gpe1_blk_len, "GPE1_BLK");
+		if (request_region(acpi_gbl_FADT->xgpe1_blk.address,
+				   acpi_gbl_FADT->gpe1_blk_len,
+				   "GPE1_BLK") = NULL) {
+			printk(KERN_WARNING "acpi_reserve_resources: could not"
+					    "allocate GPE1_BLK region\n");
+			goto out_gpe1_blk;
+		}
+
+	return 0;
+
+out_gpe1_blk:
+	if (acpi_gbl_FADT->xgpe0_blk.address && acpi_gbl_FADT->gpe0_blk_len &&
+	    !(acpi_gbl_FADT->gpe0_blk_len & 0x1))
+		release_region(acpi_gbl_FADT->xgpe0_blk.address,
+			       acpi_gbl_FADT->gpe0_blk_len);
+out_gpe0_blk:
+	if (acpi_gbl_FADT->xpm2_cnt_blk.address && acpi_gbl_FADT->pm2_cnt_len)
+		release_region(acpi_gbl_FADT->xpm2_cnt_blk.address,
+			       acpi_gbl_FADT->pm2_cnt_len);
+out_pm2_cnt_blk:
+	if (acpi_gbl_FADT->xpm_tmr_blk.address && acpi_gbl_FADT->pm_tm_len = 4)
+		release_region(acpi_gbl_FADT->xpm_tmr_blk.address, 4);
+out_pm_tmr:
+	if (acpi_gbl_FADT->xpm1b_cnt_blk.address && acpi_gbl_FADT->pm1_cnt_len)
+		release_region(acpi_gbl_FADT->xpm1b_cnt_blk.address,
+			       acpi_gbl_FADT->pm1_cnt_len);
+out_pm1b_cnt_blk:
+	if (acpi_gbl_FADT->xpm1a_cnt_blk.address && acpi_gbl_FADT->pm1_cnt_len)
+		release_region(acpi_gbl_FADT->xpm1a_cnt_blk.address,
+			       acpi_gbl_FADT->pm1_cnt_len);
+out_pm1a_cnt_blk:
+	if (acpi_gbl_FADT->xpm1b_evt_blk.address && acpi_gbl_FADT->pm1_evt_len)
+		release_region(acpi_gbl_FADT->xpm1b_evt_blk.address,
+			       acpi_gbl_FADT->pm1_evt_len);
+out_pm1b_evt_blk:
+	if (acpi_gbl_FADT->xpm1a_evt_blk.address && acpi_gbl_FADT->pm1_evt_len)
+		release_region(acpi_gbl_FADT->xpm1a_evt_blk.address,
+			       acpi_gbl_FADT->pm1_evt_len);
+out_pm1a_evt_blk:
+	return -EBUSY;
 }
 
 static int __init acpi_motherboard_init(void)
@@ -170,7 +243,8 @@ static int __init acpi_motherboard_init(
 	 * This module must run after scan.c
 	 */
 	if (!acpi_disabled)
-		acpi_reserve_resources();
+		return acpi_reserve_resources();
+
 	return 0;
 }
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
