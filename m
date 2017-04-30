From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 30 Apr 2017 07:14:20 +0000
Subject: [PATCH] cris: nand: fix a leak in error handling path
Message-Id: <20170430071420.24906-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: starvik@axis.com, jesper.nilsson@axis.com
Cc: linux-cris-kernel@axis.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If only 1 of the 2 'ioremap' fails, then there is a small leak.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index a74540514bdb..57622fbd9f25 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -123,7 +123,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	if (!read_cs || !write_cs) {
 		printk(KERN_ERR "CRISv32 NAND ioremap failed\n");
 		err = -EIO;
-		goto out_mtd;
+		goto out_ior;
 	}
 
 	/* Get pointer to private data */
@@ -162,9 +162,11 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	return crisv32_mtd;
 
 out_ior:
-	iounmap((void *)read_cs);
-	iounmap((void *)write_cs);
-out_mtd:
+	if (read_cs)
+		iounmap((void *)read_cs);
+	if (write_cs)
+		iounmap((void *)write_cs);
+
 	kfree(wrapper);
 	return NULL;
 }
-- 
2.11.0

