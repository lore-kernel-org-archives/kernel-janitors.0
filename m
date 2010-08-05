From: Julia Lawall <julia@diku.dk>
Date: Thu, 05 Aug 2010 20:26:20 +0000
Subject: [PATCH 31/42] drivers/net: Adjust confusing if indentation
Message-Id: <Pine.LNX.4.64.1008052226050.31692@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Julia Lawall <julia@diku.dk>

Outdent the code following the if.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable braces4@
position p1,p2;
statement S1,S2;
@@

(
if (...) { ... }
|
if (...) S1@p1 S2@p2
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

if (p1[0].column = p2[0].column):
  cocci.print_main("branch",p1)
  cocci.print_secs("after",p2)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/gianfar.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/gianfar.c b/drivers/net/gianfar.c
index a1b6301..36ccc37 100644
--- a/drivers/net/gianfar.c
+++ b/drivers/net/gianfar.c
@@ -1859,7 +1859,7 @@ static int register_grp_irqs(struct gfar_priv_grp *grp)
 				printk(KERN_ERR "%s: Can't get IRQ %d\n",
 					dev->name, grp->interruptError);
 
-				goto err_irq_fail;
+			goto err_irq_fail;
 		}
 
 		if ((err = request_irq(grp->interruptTransmit, gfar_transmit,
