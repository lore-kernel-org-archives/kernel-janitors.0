From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 Jan 2018 10:51:17 +0000
Subject: [PATCH 1/2] mtd/maps/sun_uflash: Delete an error message for a failed memory allocation in uflash_de
Message-Id: <7417f52d-ddba-e8f8-0014-31bc787213db@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <30c07f5a-578c-0e53-b80f-675fb24e6223@users.sourceforge.net>
In-Reply-To: <30c07f5a-578c-0e53-b80f-675fb24e6223@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jan 2018 10:20:14 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/maps/sun_uflash.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index 1e73bba6e286..80a253cc72e2 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -62,10 +62,8 @@ int uflash_devinit(struct platform_device *op, struct device_node *dp)
 	}
 
 	up = kzalloc(sizeof(struct uflash_dev), GFP_KERNEL);
-	if (!up) {
-		printk(KERN_ERR PFX "Cannot allocate struct uflash_dev\n");
+	if (!up)
 		return -ENOMEM;
-	}
 
 	/* copy defaults and tweak parameters */
 	memcpy(&up->map, &uflash_map_templ, sizeof(uflash_map_templ));
-- 
2.15.1

