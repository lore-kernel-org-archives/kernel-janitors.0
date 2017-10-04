From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Oct 2017 18:45:14 +0000
Subject: [PATCH 1/5] cris: nand: Delete an error message for a failed memory allocation in crisv32_nand_flash
Message-Id: <92a95fe3-5b8d-5dd9-a7bf-131a999e74c6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
In-Reply-To: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cris-kernel@axis.com, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Halasa <khalasa@piap.pl>, Mikael Starvik <starvik@axis.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Oct 2017 17:54:11 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 2 --
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index 925a98eb6d68..259aa1f46fbe 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -136,8 +136,6 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	/* Allocate memory for MTD device structure and private data */
 	wrapper = kzalloc(sizeof(struct mtd_info_wrapper), GFP_KERNEL);
 	if (!wrapper) {
-		printk(KERN_ERR "Unable to allocate CRISv32 NAND MTD "
-			"device structure.\n");
 		err = -ENOMEM;
 		return NULL;
 	}
diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index 53b56a429dde..1baf16ee74e8 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -111,8 +111,6 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	/* Allocate memory for MTD device structure and private data */
 	wrapper = kzalloc(sizeof(struct mtd_info_wrapper), GFP_KERNEL);
 	if (!wrapper) {
-		printk(KERN_ERR "Unable to allocate CRISv32 NAND MTD "
-			"device structure.\n");
 		err = -ENOMEM;
 		return NULL;
 	}
-- 
2.14.2

