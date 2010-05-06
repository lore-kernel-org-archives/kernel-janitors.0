From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 06 May 2010 08:04:19 +0000
Subject: [PATCH] mmci-omap: Use resource_size
Message-Id: <1273133059-6335-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jarkko.lavinen@nokia.com
Cc: tony@atomide.com, linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>

Use the resource_size function instead of manually calculating the
resource size.  This reduces the chance of introducing off-by-one
errors.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/mmc/host/omap.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
index 84d2804..a2c8545 100644
--- a/drivers/mmc/host/omap.c
+++ b/drivers/mmc/host/omap.c
@@ -1415,7 +1415,7 @@ static int __init mmc_omap_probe(struct platform_device *pdev)
 	if (res = NULL || irq < 0)
 		return -ENXIO;
 
-	res = request_mem_region(res->start, res->end - res->start + 1,
+	res = request_mem_region(res->start, resource_size(res),
 				 pdev->name);
 	if (res = NULL)
 		return -EBUSY;
@@ -1537,7 +1537,7 @@ static int mmc_omap_remove(struct platform_device *pdev)
 
 	iounmap(host->virt_base);
 	release_mem_region(pdev->resource[0].start,
-			   pdev->resource[0].end - pdev->resource[0].start + 1);
+			   resource_size(&pdev->resource[0]));
 
 	kfree(host);
 
-- 
1.6.3.3

