From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Oct 2017 18:50:37 +0000
Subject: [PATCH 5/5] cris: nand: Split a condition check in crisv32_nand_flash_probe()
Message-Id: <290ad3d7-eb40-5c60-068f-3835063babc2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
In-Reply-To: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cris-kernel@axis.com, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Halasa <khalasa@piap.pl>, Mikael Starvik <starvik@axis.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Oct 2017 20:02:12 +0200

* Split a condition check for failed calls of the function "ioremap"
  so that the return value in the variable "write_cs" will also be
  immediately checked.

* Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index 2b53f0c615ea..564218a12213 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -113,13 +113,17 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 		return NULL;
 
 	read_cs = ioremap(MEM_CSP0_START | MEM_NON_CACHEABLE, 8192);
-	write_cs = ioremap(MEM_CSP1_START | MEM_NON_CACHEABLE, 8192);
-
-	if (!read_cs || !write_cs) {
+	if (!read_cs) {
 		printk(KERN_ERR "CRISv32 NAND ioremap failed\n");
 		goto out_mtd;
 	}
 
+	write_cs = ioremap(MEM_CSP1_START | MEM_NON_CACHEABLE, 8192);
+	if (!write_cs) {
+		printk(KERN_ERR "CRISv32 NAND ioremap failed\n");
+		goto unmap_read;
+	}
+
 	/* Get pointer to private data */
 	this = &wrapper->chip;
 	crisv32_mtd = nand_to_mtd(this);
@@ -149,13 +153,14 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 
 	/* Scan to find existence of the device */
 	if (nand_scan(crisv32_mtd, 1))
-		goto out_ior;
+		goto unmap_io;
 
 	return crisv32_mtd;
 
-out_ior:
-	iounmap((void *)read_cs);
+unmap_io:
 	iounmap((void *)write_cs);
+unmap_read:
+	iounmap((void *)read_cs);
 out_mtd:
 	kfree(wrapper);
 	return NULL;
-- 
2.14.2

