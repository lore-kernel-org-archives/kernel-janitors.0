From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Feb 2016 21:30:29 +0000
Subject: [patch] drm/rockchip: inno_hdmi: fix an error code
Message-Id: <20160225213029.GA18267@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Yao <mark.yao@rock-chips.com>, Yakir Yang <ykk@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We were accidentally returning PTR_ERR(NULL) which means success when we
wanted to return a negative error code.

Fixes: 412d4ae6b7a5 ('drm/rockchip: hdmi: add Innosilicon HDMI support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 10d62ff..f252441 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -855,8 +855,9 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 
 	hdmi->ddc = inno_hdmi_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->ddc)) {
+		ret = PTR_ERR(hdmi->ddc);
 		hdmi->ddc = NULL;
-		return PTR_ERR(hdmi->ddc);
+		return ret;
 	}
 
 	/*
