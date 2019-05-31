From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 May 2019 14:20:49 +0000
Subject: [PATCH] media: staging/imx: fix two NULL vs IS_ERR() bugs
Message-Id: <20190531142048.GA383@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Longerbeam <slongerbeam@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The imx_media_pipeline_pad() function return NULL pointers on error, it
never returns error pointers.

Fixes: 3ef46bc97ca2 ("media: staging/imx: Improve pipeline searching")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/imx/imx-media-csi.c  | 4 ++--
 drivers/staging/media/imx/imx7-media-csi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index d2f880938af9..0eeb0db6d83f 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -193,8 +193,8 @@ static int csi_get_upstream_endpoint(struct csi_priv *priv,
 
 	/* get source pad of entity directly upstream from src */
 	pad = imx_media_pipeline_pad(src, 0, 0, true);
-	if (IS_ERR(pad))
-		return PTR_ERR(pad);
+	if (!pad)
+		return -ENODEV;
 
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 
diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index b1af8694899e..882690561357 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -439,8 +439,8 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
 skip_video_mux:
 	/* get source pad of entity directly upstream from src */
 	pad = imx_media_pipeline_pad(src, 0, 0, true);
-	if (IS_ERR(pad))
-		return PTR_ERR(pad);
+	if (!pad)
+		return -ENODEV;
 
 	sd = media_entity_to_v4l2_subdev(pad->entity);
 
-- 
2.20.1
