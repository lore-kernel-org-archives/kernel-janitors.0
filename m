From: Julia Lawall <julia@diku.dk>
Date: Sun, 29 Aug 2010 09:52:42 +0000
Subject: [PATCH 3/7] drivers/mtd/nand/mpc5121_nfc.c: Add of_node_put to avoid memory leak
Message-Id: <1283075566-27441-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
In-Reply-To: <1283075566-27441-1-git-send-email-julia-dAYI7NvHqcQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Add a call to of_node_put in the error handling code following a call to
of_find_compatible_node.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression x;
expression E,E1;
statement S;
@@

*x = 
(of_find_node_by_path
|of_find_node_by_name
|of_find_node_by_phandle
|of_get_parent
|of_get_next_parent
|of_get_next_child
|of_find_compatible_node
|of_match_node
)(...);
...
if (x = NULL) S
<... when != x = E
*if (...) {
  ... when != of_node_put(x)
      when != if (...) { ... of_node_put(x); ... }
(
  return <+...x...+>;
|
*  return ...;
)
}
...>
of_node_put(x);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/nand/mpc5121_nfc.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/mpc5121_nfc.c b/drivers/mtd/nand/mpc5121_nfc.c
index df0c1da..f4610bc 100644
--- a/drivers/mtd/nand/mpc5121_nfc.c
+++ b/drivers/mtd/nand/mpc5121_nfc.c
@@ -568,6 +568,7 @@ static int mpc5121_nfc_read_hw_config(struct mtd_info *mtd)
 	uint rcw_width;
 	uint rcwh;
 	uint romloc, ps;
+	int ret = 0;
 
 	rmnode = of_find_compatible_node(NULL, NULL, "fsl,mpc5121-reset");
 	if (!rmnode) {
@@ -579,7 +580,8 @@ static int mpc5121_nfc_read_hw_config(struct mtd_info *mtd)
 	rm = of_iomap(rmnode, 0);
 	if (!rm) {
 		dev_err(prv->dev, "Error mapping reset module node!\n");
-		return -EBUSY;
+		ret = -EBUSY;
+		goto out;
 	}
 
 	rcwh = in_be32(&rm->rcwhr);
@@ -628,8 +630,9 @@ static int mpc5121_nfc_read_hw_config(struct mtd_info *mtd)
 				rcw_width * 8, rcw_pagesize,
 				rcw_sparesize);
 	iounmap(rm);
+out:
 	of_node_put(rmnode);
-	return 0;
+	return ret;
 }
 
 /* Free driver resources */

