From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 18:08:09 +0000
Subject: [PATCH] drivers/mfd: Adjust NULL test
Message-Id: <Pine.LNX.4.64.0812211907400.9555@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sameo@openedhand.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Since ei is already known to be non-NULL, I assume that what was intended
was to test the result of kzalloc.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression E,E1;
identifier f,fld,fld1;
statement S1,S2;
@@

E->fld = f(...);
... when != E = E1
    when != E->fld1 = E1
if (
-   E
+   E->fld
           = NULL) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mfd/htc-egpio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/mfd/htc-egpio.c b/drivers/mfd/htc-egpio.c
--- a/drivers/mfd/htc-egpio.c
+++ b/drivers/mfd/htc-egpio.c
@@ -307,7 +307,7 @@ static int __init egpio_probe(struct pla
 
 	ei->nchips = pdata->num_chips;
 	ei->chip = kzalloc(sizeof(struct egpio_chip) * ei->nchips, GFP_KERNEL);
-	if (!ei) {
+	if (!ei->chip) {
 		ret = -ENOMEM;
 		goto fail;
 	}
