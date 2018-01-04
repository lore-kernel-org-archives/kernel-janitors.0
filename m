From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 Jan 2018 10:52:27 +0000
Subject: [PATCH 2/2] mtd/maps/sun_uflash: Improve a size determination in uflash_devinit()
Message-Id: <1c70e16b-f34c-d655-fdd4-67730f17a680@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <30c07f5a-578c-0e53-b80f-675fb24e6223@users.sourceforge.net>
In-Reply-To: <30c07f5a-578c-0e53-b80f-675fb24e6223@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jan 2018 11:38:28 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/maps/sun_uflash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/sun_uflash.c b/drivers/mtd/maps/sun_uflash.c
index 80a253cc72e2..16a4f16a2680 100644
--- a/drivers/mtd/maps/sun_uflash.c
+++ b/drivers/mtd/maps/sun_uflash.c
@@ -61,7 +61,7 @@ int uflash_devinit(struct platform_device *op, struct device_node *dp)
 		return -ENODEV;
 	}
 
-	up = kzalloc(sizeof(struct uflash_dev), GFP_KERNEL);
+	up = kzalloc(sizeof(*up), GFP_KERNEL);
 	if (!up)
 		return -ENOMEM;
 
-- 
2.15.1

