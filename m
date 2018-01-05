From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 Jan 2018 20:28:58 +0000
Subject: [PATCH 1/3] mtd/nand/ams-delta: Delete an error message for a failed memory allocation in ams_delta_
Message-Id: <0ab36d19-fb5b-ab7f-5821-7c0574f9589f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8f678424-3ce1-3a4c-1b0d-f3ac9a226f00@users.sourceforge.net>
In-Reply-To: <8f678424-3ce1-3a4c-1b0d-f3ac9a226f00@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 Jan 2018 21:01:18 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/nand/ams-delta.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/ams-delta.c b/drivers/mtd/nand/ams-delta.c
index d60ada45c549..effaecff0f2e 100644
--- a/drivers/mtd/nand/ams-delta.c
+++ b/drivers/mtd/nand/ams-delta.c
@@ -185,7 +185,6 @@ static int ams_delta_init(struct platform_device *pdev)
 	/* Allocate memory for MTD device structure and private data */
 	this = kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
 	if (!this) {
-		printk (KERN_WARNING "Unable to allocate E3 NAND MTD device structure.\n");
 		err = -ENOMEM;
 		goto out;
 	}
-- 
2.15.1

