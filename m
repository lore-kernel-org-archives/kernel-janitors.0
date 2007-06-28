From: "Suresh Jayaraman" <sjayaraman@novell.com>
Date: Thu, 28 Jun 2007 17:53:58 +0000
Subject: [KJ] [PATCH] mtd: Remove unnecessary cast of return value of
Message-Id: <4684430E020000F40000A9C3@lucius.provo.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove unnecessary cast of return value of kmalloc()/kzalloc().

Signed-off-by: Suresh Jayaraman <sjayaraman@novell.com>
---

 drivers/mtd/devices/at91_dataflash26.c |    3 +--
 drivers/mtd/maps/pmcmsp-flash.c        |   13 +++++--------
 drivers/mtd/maps/tqm8xxl.c             |    2 +-
 3 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/devices/at91_dataflash26.c b/drivers/mtd/devices/at91_dataflash26.c
index 64ce37f..9c4aac4 100644
--- a/drivers/mtd/devices/at91_dataflash26.c
+++ b/drivers/mtd/devices/at91_dataflash26.c
@@ -360,8 +360,7 @@ static int __init add_dataflash(int channel, char *name, int nr_pages,
 	device->read = at91_dataflash26_read;
 	device->write = at91_dataflash26_write;
 
-	priv = (struct dataflash_local *)kzalloc(sizeof(struct dataflash_local),
-		GFP_KERNEL);
+	priv = kzalloc(sizeof(struct dataflash_local), GFP_KERNEL);
 	if (!priv) {
 		kfree(device);
 		return -ENOMEM;
diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index 7e0377e..8060674 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -73,12 +73,9 @@ int __init init_msp_flash(void)
 		return -ENXIO;
 
 	printk(KERN_NOTICE "Found %d PMC flash devices\n", fcnt);
-	msp_flash = (struct mtd_info **)kmalloc(
-			fcnt * sizeof(struct map_info *), GFP_KERNEL);
-	msp_parts = (struct mtd_partition **)kmalloc(
-			fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
-	msp_maps = (struct map_info *)kmalloc(
-			fcnt * sizeof(struct mtd_info), GFP_KERNEL);
+	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
+	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
+	msp_maps = kmalloc(fcnt * sizeof(struct mtd_info), GFP_KERNEL);
 	memset(msp_maps, 0, fcnt * sizeof(struct mtd_info));
 
 	/* loop over the flash devices, initializing each */
@@ -95,8 +92,8 @@ int __init init_msp_flash(void)
 			continue;
 		}
 
-		msp_parts[i] = (struct mtd_partition *)kmalloc(
-			pcnt * sizeof(struct mtd_partition), GFP_KERNEL);
+		msp_parts[i] = kmalloc(pcnt * sizeof(struct mtd_partition),
+				       GFP_KERNEL);
 		memset(msp_parts[i], 0, pcnt * sizeof(struct mtd_partition));
 
 		/* now initialize the devices proper */
diff --git a/drivers/mtd/maps/tqm8xxl.c b/drivers/mtd/maps/tqm8xxl.c
index 37e4ded..7a35e26 100644
--- a/drivers/mtd/maps/tqm8xxl.c
+++ b/drivers/mtd/maps/tqm8xxl.c
@@ -141,7 +141,7 @@ int __init init_tqm_mtd(void)
 			goto error_mem;
 		}
 
-		map_banks[idx]->name = (char *)kmalloc(16, GFP_KERNEL);
+		map_banks[idx]->name = kmalloc(16, GFP_KERNEL);
 
 		if (!map_banks[idx]->name) {
 			ret = -ENOMEM;

-- 
Suresh Jayaraman


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
