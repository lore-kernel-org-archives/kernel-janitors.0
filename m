From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 21 Jan 2013 12:16:16 +0000
Subject: [PATCH 3/15] drivers/staging/omap-thermal/omap-bandgap.c: adjust duplicate test
Message-Id: <1358773378-4700-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1358773378-4700-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete successive tests to the same location.  There was a previous test on
ret and it has not been updated since then.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@s exists@
local idexpression y;
expression x,e;
@@

*if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
 { ... when forall
   return ...; }
... when != \(y = e\|y += e\|y -= e\|y |= e\|y &= e\|y++\|y--\|&y\)
    when != \(XT_GETPAGE(...,y)\|WMI_CMD_BUF(...)\)
*if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
 { ... when forall
   return ...; }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Perhaps it was intended to test somthing, but I am not sure what.

 drivers/staging/omap-thermal/omap-bandgap.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/omap-thermal/omap-bandgap.c b/drivers/staging/omap-thermal/omap-bandgap.c
index 8346e34..89f7180 100644
--- a/drivers/staging/omap-thermal/omap-bandgap.c
+++ b/drivers/staging/omap-thermal/omap-bandgap.c
@@ -568,8 +568,6 @@ int omap_bandgap_read_update_interval(struct omap_bandgap *bg_ptr, int id,
 
 	tsr = bg_ptr->conf->sensors[id].registers;
 	time = omap_bandgap_readl(bg_ptr, tsr->bgap_counter);
-	if (ret)
-		return ret;
 	time = (time & tsr->counter_mask) >> __ffs(tsr->counter_mask);
 	time = time * 1000 / bg_ptr->clk_rate;
 
