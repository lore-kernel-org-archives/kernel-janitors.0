From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2019 07:27:04 +0000
Subject: [PATCH 1/2] drm/bridge: sii902x: re-order conditions to prevent out of bounds read
Message-Id: <20190607072704.GA25229@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha <jsarha@ti.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>

This should check that "i" is within bounds before checking reading from
the array.

Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index d6f98d388ac2..6b03616d6bc3 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -589,8 +589,8 @@ static int sii902x_audio_hw_params(struct device *dev, void *data,
 	if (ret)
 		goto out;
 
-	for (i = 0; sii902x->audio.i2s_fifo_sequence[i] &&
-		     i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence); i++)
+	for (i = 0; i < ARRAY_SIZE(sii902x->audio.i2s_fifo_sequence) &&
+		    sii902x->audio.i2s_fifo_sequence[i]; i++)
 		regmap_write(sii902x->regmap,
 			     SII902X_TPI_I2S_ENABLE_MAPPING_REG,
 			     sii902x->audio.i2s_fifo_sequence[i]);
-- 
2.20.1
