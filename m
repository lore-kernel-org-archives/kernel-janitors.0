From: Colin King <colin.king@canonical.com>
Date: Tue, 21 Aug 2018 10:54:07 +0000
Subject: [PATCH] drm/pl111: add in missing sentinel to a of_device_id array
Message-Id: <20180821105407.2318-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Array vexpress_muxfpga_match is missing an end of array sentinel,
add it.

Detected by Coccinelle: ("vexpress_muxfpga_match is not NULL
terminated at line")

Fixes: ca454bd42dc2 ("drm/pl111: Support the Versatile Express")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/pl111/pl111_vexpress.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/pl111_vexpress.c b/drivers/gpu/drm/pl111/pl111_vexpress.c
index a534b225e31b..48e2afcd4798 100644
--- a/drivers/gpu/drm/pl111/pl111_vexpress.c
+++ b/drivers/gpu/drm/pl111/pl111_vexpress.c
@@ -111,7 +111,8 @@ static int vexpress_muxfpga_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id vexpress_muxfpga_match[] = {
-	{ .compatible = "arm,vexpress-muxfpga", }
+	{ .compatible = "arm,vexpress-muxfpga", },
+	{ /* sentinel */ }
 };
 
 static struct platform_driver vexpress_muxfpga_driver = {
-- 
2.17.1
