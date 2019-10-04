From: Colin King <colin.king@canonical.com>
Date: Fri, 04 Oct 2019 08:27:06 +0000
Subject: [PATCH] drm: sti: fix spelling mistake: rejec -> rejection
Message-Id: <20191004082706.26478-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>, Vincent Abriou <vincent.abriou@st.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In other places of the driver the string hdmi_rejection_pll is
used instead of the truncated hdmi_rejec_pll, so use this string
instead to be consistent.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 814560ead4e1..e2018e4a3ec5 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -886,7 +886,7 @@ static void sti_hdmi_pre_enable(struct drm_bridge *bridge)
 	if (clk_prepare_enable(hdmi->clk_tmds))
 		DRM_ERROR("Failed to prepare/enable hdmi_tmds clk\n");
 	if (clk_prepare_enable(hdmi->clk_phy))
-		DRM_ERROR("Failed to prepare/enable hdmi_rejec_pll clk\n");
+		DRM_ERROR("Failed to prepare/enable hdmi_rejection_pll clk\n");
 
 	hdmi->enabled = true;
 
-- 
2.20.1
