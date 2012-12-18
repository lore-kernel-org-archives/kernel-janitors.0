From: Tony Prisk <linux@prisktech.co.nz>
Date: Tue, 18 Dec 2012 17:34:08 +0000
Subject: [PATCH RESEND 6/6] clk: s5p-g2d: Fix incorrect usage of IS_ERR_OR_NULL
Message-Id: <1355852048-23188-7-git-send-email-linux@prisktech.co.nz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
In-Reply-To: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Resend to include mailing lists.

Replace IS_ERR_OR_NULL with IS_ERR on clk_get results.

Signed-off-by: Tony Prisk <linux@prisktech.co.nz>
CC: Kyungmin Park <kyungmin.park@samsung.com>
CC: Tomasz Stanislawski <t.stanislaws@samsung.com>
CC: linux-media@vger.kernel.org
---
 drivers/media/platform/s5p-g2d/g2d.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
index 1bfbc32..dcd5335 100644
--- a/drivers/media/platform/s5p-g2d/g2d.c
+++ b/drivers/media/platform/s5p-g2d/g2d.c
@@ -715,7 +715,7 @@ static int g2d_probe(struct platform_device *pdev)
 	}
 
 	dev->clk = clk_get(&pdev->dev, "sclk_fimg2d");
-	if (IS_ERR_OR_NULL(dev->clk)) {
+	if (IS_ERR(dev->clk)) {
 		dev_err(&pdev->dev, "failed to get g2d clock\n");
 		return -ENXIO;
 	}
@@ -727,7 +727,7 @@ static int g2d_probe(struct platform_device *pdev)
 	}
 
 	dev->gate = clk_get(&pdev->dev, "fimg2d");
-	if (IS_ERR_OR_NULL(dev->gate)) {
+	if (IS_ERR(dev->gate)) {
 		dev_err(&pdev->dev, "failed to get g2d clock gate\n");
 		ret = -ENXIO;
 		goto unprep_clk;
-- 
1.7.9.5

