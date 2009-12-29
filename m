From: Julia Lawall <julia@diku.dk>
Date: Tue, 29 Dec 2009 19:15:23 +0000
Subject: [PATCH 1/5] drivers/mtd : Correct the size argument to kzalloc
Message-Id: <Pine.LNX.4.64.0912292015001.4001@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

mtd_list has type struct mtd_info **, not struct mtd_info *, so the
elements of the array should have pointer type, not structure type.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@disable sizeof_type_expr@
type T;
T **x;
@@

  x   <+...sizeof(
- T
+ *x
  )...+>
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/physmap_of.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -217,7 +217,7 @@ static int __devinit of_flash_probe(stru
 
 	dev_set_drvdata(&dev->dev, info);
 
-	mtd_list = kzalloc(sizeof(struct mtd_info) * count, GFP_KERNEL);
+	mtd_list = kzalloc(sizeof(*mtd_list) * count, GFP_KERNEL);
 	if (!mtd_list)
 		goto err_flash_remove;
 
