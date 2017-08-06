From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 06 Aug 2017 12:55:01 +0000
Subject: [PATCH] mtd: physmap_of: Fix resources leak in 'of_flash_probe()'
Message-Id: <20170806125501.10368-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'of_flash_probe_gemini()' or 'of_flash_probe_versatile()' fail, we must
reslease some resources, as already done in all error handling paths in
this function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/maps/physmap_of_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physmap_of_core.c
index 62fa6836f218..2c8cc97ce019 100644
--- a/drivers/mtd/maps/physmap_of_core.c
+++ b/drivers/mtd/maps/physmap_of_core.c
@@ -235,10 +235,10 @@ static int of_flash_probe(struct platform_device *dev)
 
 		err = of_flash_probe_gemini(dev, dp, &info->list[i].map);
 		if (err)
-			return err;
+			goto err_out;
 		err = of_flash_probe_versatile(dev, dp, &info->list[i].map);
 		if (err)
-			return err;
+			goto err_out;
 
 		err = -ENOMEM;
 		info->list[i].map.virt = ioremap(info->list[i].map.phys,
-- 
2.11.0

