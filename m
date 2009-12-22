From: Julia Lawall <julia@diku.dk>
Date: Tue, 22 Dec 2009 20:31:43 +0000
Subject: [PATCH 3/6] drivers/mfd: Correct use after free
Message-Id: <Pine.LNX.4.64.0912222131230.28669@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sameo@linux.intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The structure t7l66xb should not be freed before the subsequent references
to its fields in the arguments to clk_put.  Furthermore, this structure is
allocated near the beginning of the function, and a goto to the label
err_noirq appears after a successful allocation, so it would seem that the
kfree should be moved down below this label.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,e;
identifier f;
iterator I;
statement S;
@@

*kfree(x);
... when != &x
    when != x = e
    when != I(x,...) S
*x->f
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mfd/t7l66xb.c               |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/t7l66xb.c b/drivers/mfd/t7l66xb.c
index 2fa0703..dad3768 100644
--- a/drivers/mfd/t7l66xb.c
+++ b/drivers/mfd/t7l66xb.c
@@ -405,12 +405,12 @@ static int t7l66xb_probe(struct platform_device *dev)
 err_ioremap:
 	release_resource(&t7l66xb->rscr);
 err_request_scr:
-	kfree(t7l66xb);
 	clk_put(t7l66xb->clk48m);
 err_clk48m_get:
 	clk_put(t7l66xb->clk32k);
 err_clk32k_get:
 err_noirq:
+	kfree(t7l66xb);
 	return ret;
 }
 
