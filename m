From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Apr 2017 10:24:23 +0000
Subject: [PATCH] drm/mediatek: fix a loop timeout
Message-Id: <20170420102423.5yqe6uwohaeleyyl@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: CK Hu <ck.hu@mediatek.com>, shaoming chen <shaoming.chen@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>

We expected to end with "timeout_ms" set to zero, but it's a post-op so
the current code ends with -1.  Let's fix this by changing it to a
pre-op.

Fixes: 21898816831f ("drm/mediatek: add dsi transfer function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 808b995a990f..3a0b6d1057a2 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -902,7 +902,7 @@ static void mtk_dsi_wait_for_idle(struct mtk_dsi *dsi)
 {
 	u32 timeout_ms = 500000; /* total 1s ~ 2s timeout */
 
-	while (timeout_ms--) {
+	while (--timeout_ms) {
 		if (!(readl(dsi->regs + DSI_INTSTA) & DSI_BUSY))
 			break;
 
