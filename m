From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Jan 2015 11:01:26 +0000
Subject: [patch] drm/tegra: bad irqsave/restore in tegra_dc_finish_page_flip()
Message-Id: <20150107110126.GA14864@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>

We can't save two values to the IRQ flags at the same time so the IRQs
are not enabled at the end.  This kind of bug is easy to miss in testing
if the function is normally called with IRQs disabled so we wouldn't
enable IRQs anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index ae26cc0..c746161 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -838,7 +838,7 @@ static void tegra_dc_finish_page_flip(struct tegra_dc *dc)
 
 	bo = tegra_fb_get_plane(crtc->primary->fb, 0);
 
-	spin_lock_irqsave(&dc->lock, flags);
+	spin_lock(&dc->lock);
 
 	/* check if new start address has been latched */
 	tegra_dc_writel(dc, WINDOW_A_SELECT, DC_CMD_DISPLAY_WINDOW_HEADER);
@@ -846,7 +846,7 @@ static void tegra_dc_finish_page_flip(struct tegra_dc *dc)
 	base = tegra_dc_readl(dc, DC_WINBUF_START_ADDR);
 	tegra_dc_writel(dc, 0, DC_CMD_STATE_ACCESS);
 
-	spin_unlock_irqrestore(&dc->lock, flags);
+	spin_unlock(&dc->lock);
 
 	if (base = bo->paddr + crtc->primary->fb->offsets[0]) {
 		drm_crtc_send_vblank_event(crtc, dc->event);
