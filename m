From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 Nov 2019 15:32:12 +0000
Subject: [PATCH -next] media: sun8i: Remove redundant dev_err call in deinterlace_probe()
Message-Id: <20191106153213.13752-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jernej Skrabec <jernej.skrabec@siol.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
index aaa1dc159ac2..b61f3dea7c93 100644
--- a/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
+++ b/drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
@@ -834,11 +834,8 @@ static int deinterlace_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	dev->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(dev->base)) {
-		dev_err(dev->dev, "Failed to map registers\n");
-
+	if (IS_ERR(dev->base))
 		return PTR_ERR(dev->base);
-	}
 
 	dev->bus_clk = devm_clk_get(dev->dev, "bus");
 	if (IS_ERR(dev->bus_clk)) {
