From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Jan 2020 13:19:53 +0000
Subject: [PATCH][next][V2] dmaengine: ti: omap-dma: don't allow a null od->plat pointer to be dereferenced
Message-Id: <20200109131953.157154-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Tony Lindgren <tony@atomide.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to dev_get_platdata returns null the driver issues
a warning and then later dereferences the null pointer.  Avoid this issue
by returning -ENODEV errror rather when the platform data is null and
change the warning to an appropriate error message.

Addresses-Coverity: ("Dereference after null check")
Fixes: 211010aeb097 ("dmaengine: ti: omap-dma: Pass sdma auxdata to driver and use it")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: return -ENODEV and change warning to an error message as suggested by
    Peter Ujfalusi.
---
 drivers/dma/ti/omap-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index fc8f7b2fc7b3..a93515015dce 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -1658,8 +1658,10 @@ static int omap_dma_probe(struct platform_device *pdev)
 	if (conf) {
 		od->cfg = conf;
 		od->plat = dev_get_platdata(&pdev->dev);
-		if (!od->plat)
-			dev_warn(&pdev->dev, "no sdma auxdata needed?\n");
+		if (!od->plat) {
+			dev_err(&pdev->dev, "omap_system_dma_plat_info is missing");
+			return -ENODEV;
+		}
 	} else {
 		od->cfg = &default_cfg;
 
-- 
2.24.0
