From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 21 Aug 2013 08:30:08 +0000
Subject: [patch] staging: drm/imx: ipu-dc: signedness bug in ipu_dc_init_sync()
Message-Id: <20130821083008.GD5240@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"map" needs to be signed for the error handling to work.  In the success
case then it holds a small non-negative value.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
index 59f03f9..21bf1c8 100644
--- a/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
+++ b/drivers/staging/imx-drm/ipu-v3/ipu-dc.c
@@ -161,14 +161,15 @@ int ipu_dc_init_sync(struct ipu_dc *dc, struct ipu_di *di, bool interlaced,
 		u32 pixel_fmt, u32 width)
 {
 	struct ipu_dc_priv *priv = dc->priv;
-	u32 reg = 0, map;
+	u32 reg = 0;
+	int map;
 
 	dc->di = ipu_di_get_num(di);
 
 	map = ipu_pixfmt_to_map(pixel_fmt);
 	if (map < 0) {
 		dev_dbg(priv->dev, "IPU_DISP: No MAP\n");
-		return -EINVAL;
+		return map;
 	}
 
 	if (interlaced) {
