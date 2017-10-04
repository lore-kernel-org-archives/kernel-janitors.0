From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Oct 2017 18:46:15 +0000
Subject: [PATCH 2/5] cris: nand: Improve a size determination in crisv32_nand_flash_probe()
Message-Id: <c2a6e5a5-0120-d16f-d809-8d5a67fba413@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
In-Reply-To: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cris-kernel@axis.com, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Halasa <khalasa@piap.pl>, Mikael Starvik <starvik@axis.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Oct 2017 18:00:33 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 2 +-
 arch/cris/arch-v32/drivers/mach-fs/nandflash.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index 259aa1f46fbe..3b5be9b984b4 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -134,7 +134,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	REG_WR(pio, regi_pio, rw_oe, oe);
 
 	/* Allocate memory for MTD device structure and private data */
-	wrapper = kzalloc(sizeof(struct mtd_info_wrapper), GFP_KERNEL);
+	wrapper = kzalloc(sizeof(*wrapper), GFP_KERNEL);
 	if (!wrapper) {
 		err = -ENOMEM;
 		return NULL;
diff --git a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
index 1baf16ee74e8..5dfd72a89b8a 100644
--- a/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-fs/nandflash.c
@@ -109,7 +109,7 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	wrapper = kzalloc(sizeof(struct mtd_info_wrapper), GFP_KERNEL);
+	wrapper = kzalloc(sizeof(*wrapper), GFP_KERNEL);
 	if (!wrapper) {
 		err = -ENOMEM;
 		return NULL;
-- 
2.14.2

