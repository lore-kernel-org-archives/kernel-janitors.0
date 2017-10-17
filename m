From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Oct 2017 20:43:43 +0000
Subject: [PATCH] drm/bridge: adv7511: Fix a use after free
Message-Id: <20171017204343.zctliubjkq7imudi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Archit Taneja <architt@codeaurora.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Hans Verkuil <hans.verkuil@cisco.com>, Bhumika Goyal <bhumirks@gmail.com>

We free "edid", then use it again on the next line.

Fixes: 3b1b975003e4 ("drm: adv7511/33: add HDMI CEC support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 31ca883bda83..0e14f1572d05 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -607,10 +607,10 @@ static int adv7511_get_modes(struct adv7511 *adv7511,
 	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
 			       drm_detect_hdmi_monitor(edid));
 
-	kfree(edid);
-
 	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
 
+	kfree(edid);
+
 	return count;
 }
 
