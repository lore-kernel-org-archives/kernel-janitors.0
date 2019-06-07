From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2019 07:27:27 +0000
Subject: [PATCH 2/2] drm/bridge: sii902x: fix a signedness bug in sii902x_audio_codec_init()
Message-Id: <20190607072727.GB25229@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha <jsarha@ti.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>

The "num_lanes" variable needs to be signed for the error handling to
work.  The "i" variable can be a regular int as well.

Fixes: ff5781634c41 ("drm/bridge: sii902x: Implement HDMI audio support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 6b03616d6bc3..dd7aa466b280 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -719,7 +719,7 @@ static int sii902x_audio_codec_init(struct sii902x *sii902x,
 		.max_i2s_channels = 0,
 	};
 	u8 lanes[4];
-	u32 num_lanes, i;
+	int num_lanes, i;
 
 	if (!of_property_read_bool(dev->of_node, "#sound-dai-cells")) {
 		dev_dbg(dev, "%s: No \"#sound-dai-cells\", no audio\n",
-- 
2.20.1
