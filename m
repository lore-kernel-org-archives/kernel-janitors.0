From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Jan 2020 12:23:25 +0000
Subject: [PATCH][next] dmaengine: ti: omap-dma: don't allow a null od->plat pointer to be dereferenced
Message-Id: <20200106122325.39121-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tony Lindgren <tony@atomide.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to dev_get_platdata returns null the driver issues
a warning and then later dereferences the null pointer.  Avoid this issue
by returning -EPROBE_DEFER errror rather when the platform data is null.

Addresses-Coverity: ("Dereference after null check")
Fixes: 211010aeb097 ("dmaengine: ti: omap-dma: Pass sdma auxdata to driver and use it")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/ti/omap-dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index fc8f7b2fc7b3..335c3fa7a3b1 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -1658,8 +1658,10 @@ static int omap_dma_probe(struct platform_device *pdev)
 	if (conf) {
 		od->cfg = conf;
 		od->plat = dev_get_platdata(&pdev->dev);
-		if (!od->plat)
+		if (!od->plat) {
 			dev_warn(&pdev->dev, "no sdma auxdata needed?\n");
+			return -EPROBE_DEFER;
+		}
 	} else {
 		od->cfg = &default_cfg;
 
-- 
2.24.0
