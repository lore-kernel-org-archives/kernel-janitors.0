From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 24 Feb 2013 11:55:33 +0000
Subject: [PATCH 1/2] drivers/gpu/drm/tilcdc/tilcdc_drv.c: adjust duplicate test
Message-Id: <1361706934-15434-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1361706934-15434-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1361706934-15434-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete successive tests to the same location.

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
*if ( \(x = NULL\|IS_ERR(x)\|y != 0\) )
 { ... when forall
   return ...; }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index c5b592d..3ad0a63 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -192,7 +192,7 @@ static int tilcdc_load(struct drm_device *dev, unsigned long flags)
 	}
 
 	priv->disp_clk = clk_get(dev->dev, "dpll_disp_ck");
-	if (IS_ERR(priv->clk)) {
+	if (IS_ERR(priv->disp_clk)) {
 		dev_err(dev->dev, "failed to get display clock\n");
 		ret = -ENODEV;
 		goto fail;

