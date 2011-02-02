From: Julia Lawall <julia@diku.dk>
Date: Wed, 02 Feb 2011 16:53:23 +0000
Subject: [PATCH] drivers/mtd/maps/ts5500_flash.c: avoid calling map_destroy on NULL
Message-Id: <1296666816-21610-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

map_destroy dereferences its argument.  The call is furthermore only
reachable when this argument is NULL.  Thus the call is dropped.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
@@

*if (x = NULL)
{ ...
* map_destroy(x);
  ...
  return ...;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/ts5500_flash.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/maps/ts5500_flash.c b/drivers/mtd/maps/ts5500_flash.c
index e2147bf..e02dfa9 100644
--- a/drivers/mtd/maps/ts5500_flash.c
+++ b/drivers/mtd/maps/ts5500_flash.c
@@ -94,7 +94,6 @@ static int __init init_ts5500_map(void)
 	return 0;
 
 err1:
-	map_destroy(mymtd);
 	iounmap(ts5500_map.virt);
 err2:
 	return rc;

