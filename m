From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Oct 2017 18:47:28 +0000
Subject: [PATCH 3/5] cris: nand: Delete a jump target in crisv32_nand_flash_probe()
Message-Id: <c70b5a98-3c08-e926-23cf-18dea0ddeb5f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
In-Reply-To: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-cris-kernel@axis.com, Alexander Sverdlin <alexander.sverdlin@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Halasa <khalasa@piap.pl>, Mikael Starvik <starvik@axis.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 4 Oct 2017 18:55:01 +0200

* Move a bit of exception handling code into an if branch
  because the code was used only for one case before.

* Delete the jump target "out_mtd" which became unnecessary
  with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/cris/arch-v32/drivers/mach-a3/nandflash.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
index 3b5be9b984b4..f30579ec8ad7 100644
--- a/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
+++ b/arch/cris/arch-v32/drivers/mach-a3/nandflash.c
@@ -163,13 +163,10 @@ struct mtd_info *__init crisv32_nand_flash_probe(void)
 	/* Scan to find existence of the device */
 	if (nand_scan(crisv32_mtd, 1)) {
 		err = -ENXIO;
-		goto out_mtd;
+		kfree(wrapper);
+		return NULL;
 	}
 
 	return crisv32_mtd;
-
-out_mtd:
-	kfree(wrapper);
-	return NULL;
 }
 
-- 
2.14.2

