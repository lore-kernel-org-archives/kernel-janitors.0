From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 05 Apr 2020 11:53:05 +0000
Subject: [PATCH] drm/sun4i: tcon: Delete an error message in sun4i_tcon_init_irq()
Message-Id: <5a6cf5a7-3f27-5425-4d6a-550a17bc51e3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Apr 2020 13:45:53 +0200

The function “platform_get_irq” can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 624437b27cdc..359b56e43b83 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -812,10 +812,8 @@ static int sun4i_tcon_init_irq(struct device *dev,
 	int irq, ret;

 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "Couldn't retrieve the TCON interrupt\n");
+	if (irq < 0)
 		return irq;
-	}

 	ret = devm_request_irq(dev, irq, sun4i_tcon_handler, 0,
 			       dev_name(dev), tcon);
--
2.26.0
