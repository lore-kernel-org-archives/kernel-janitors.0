From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 09 Jan 2017 00:13:00 +0000
Subject: [PATCH] w1: omap_hdq: Free resources on error path
Message-Id: <20170109001300.3483-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zbr@ioremap.net
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error returned by '_omap_hdq_reset()', free resources as done
elsewhere in this function.

This patch slighly changes the semantic of the code. It now propagates the
error code returned by '_omap_hdq_reset()' instead of returning -EINVAL
unconditionally.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/w1/masters/omap_hdq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index bb09de633939..fb190c259607 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -715,7 +715,7 @@ static int omap_hdq_probe(struct platform_device *pdev)
 	ret = _omap_hdq_reset(hdq_data);
 	if (ret) {
 		dev_dbg(&pdev->dev, "reset failed\n");
-		return -EINVAL;
+		goto err_irq;
 	}
 
 	rev = hdq_reg_in(hdq_data, OMAP_HDQ_REVISION);
-- 
2.9.3

