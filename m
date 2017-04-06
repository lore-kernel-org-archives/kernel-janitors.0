From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Apr 2017 05:21:32 +0000
Subject: [PATCH] drm: bridge: dw-hdmi: Add a missing break statement
Message-Id: <20170406052132.GA26605@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Archit Taneja <architt@codeaurora.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Jose Abreu <Jose.Abreu@synopsys.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

There was supposed to be a break before the next case statement.

Fixes: def23aa7e982 ("drm: bridge: dw-hdmi: Switch to V4L bus format and encodings")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 84cc949eae2b..8b605039c613 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -1318,6 +1318,7 @@ static void hdmi_config_AVI(struct dw_hdmi *hdmi, struct drm_display_mode *mode)
 			frame.colorimetry = HDMI_COLORIMETRY_ITU_601;
 		frame.extended_colorimetry  				HDMI_EXTENDED_COLORIMETRY_XV_YCC_601;
+		break;
 	case V4L2_YCBCR_ENC_709:
 		if (hdmi->hdmi_data.enc_in_encoding = V4L2_YCBCR_ENC_XV709)
 			frame.colorimetry = HDMI_COLORIMETRY_EXTENDED;
