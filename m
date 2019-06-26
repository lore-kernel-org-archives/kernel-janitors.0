From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Jun 2019 14:47:46 +0000
Subject: [PATCH][next][V2] media: vivid: fix potential integer overflow on left shift
Message-Id: <20190626144746.27607-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a potential integer overflow when int 2 is left shifted
as this is evaluated using 32 bit arithmetic but is being used in
a context that expects an expression of type s64.  Fix this by
shifting 2ULL to avoid a 32 bit overflow.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 8a99e9faa131 ("media: vivid: add HDMI (dis)connect RX emulation")
Fixes: 79a792dafac6 ("media: vivid: add HDMI (dis)connect TX emulation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: use intermediate variables for the shifted expression to make code
    a bit more readable.
---
 drivers/media/platform/vivid/vivid-ctrls.c | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
index 3e916c8befb7..df1598e81c7a 100644
--- a/drivers/media/platform/vivid/vivid-ctrls.c
+++ b/drivers/media/platform/vivid/vivid-ctrls.c
@@ -1613,6 +1613,8 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	}
 
 	if (dev->num_hdmi_inputs) {
+		s64 hdmi_input = (2ULL << (dev->num_hdmi_inputs - 1)) - 1;
+
 		dev->ctrl_dv_timings_signal_mode = v4l2_ctrl_new_custom(hdl_vid_cap,
 					&vivid_ctrl_dv_timings_signal_mode, NULL);
 
@@ -1633,12 +1635,13 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 			V4L2_CID_DV_RX_RGB_RANGE, V4L2_DV_RGB_RANGE_FULL,
 			0, V4L2_DV_RGB_RANGE_AUTO);
 		dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
-			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0,
-			(2 << (dev->num_hdmi_inputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_inputs - 1)) - 1);
+			NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0, hdmi_input,
+			0, hdmi_input);
 
 	}
 	if (dev->num_hdmi_outputs) {
+		s64 hdmi_output = (2ULL << (dev->num_hdmi_outputs - 1)) - 1;
+
 		/*
 		 * We aren't doing anything with this at the moment, but
 		 * HDMI outputs typically have this controls.
@@ -1652,17 +1655,14 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 		dev->ctrl_display_present = v4l2_ctrl_new_custom(hdl_vid_out,
 			&vivid_ctrl_display_present, NULL);
 		dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
-			NULL, V4L2_CID_DV_TX_HOTPLUG, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+			NULL, V4L2_CID_DV_TX_HOTPLUG, 0, hdmi_output,
+			0, hdmi_output);
 		dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
-			NULL, V4L2_CID_DV_TX_RXSENSE, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+			NULL, V4L2_CID_DV_TX_RXSENSE, 0, hdmi_output,
+			0, hdmi_output);
 		dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
-			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1, 0,
-			(2 << (dev->num_hdmi_outputs - 1)) - 1);
+			NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0, hdmi_output,
+			0, hdmi_output);
 	}
 	if ((dev->has_vid_cap && dev->has_vid_out) ||
 	    (dev->has_vbi_cap && dev->has_vbi_out))
-- 
2.20.1
