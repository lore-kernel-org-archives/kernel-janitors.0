From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Jan 2018 08:11:13 +0000
Subject: [PATCH] drm/sun4i: Fix error code in sun4i_tcon_bind()
Message-Id: <20180115081113.wlam5wkmdynisf4r@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We accidentally passed the wrong variable to PTR_ERR().

Fixes: a0c1214e4764 ("drm/sun4i: Add LVDS support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index b78fed809992..3c15cf24b503 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -902,7 +902,7 @@ static int sun4i_tcon_bind(struct device *dev, struct device *master,
 				has_lvds_alt = false;
 			} else {
 				dev_err(dev, "Couldn't get the LVDS PLL\n");
-				return PTR_ERR(tcon->lvds_rst);
+				return PTR_ERR(tcon->lvds_pll);
 			}
 		} else {
 			has_lvds_alt = true;
