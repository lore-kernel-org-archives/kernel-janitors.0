From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Mar 2017 14:07:21 +0000
Subject: [PATCH] engine: mv_xor: remove redundant null check on cd
Message-Id: <20170301140721.22341-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check to see if cd is null is redundant, pdata->channels is
never null at this point, and hence &pdata->channels[i] cannot
be null, so remove the null check.

Detected by CoverityScan, CID#1357194 ("Logically Dead Code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/dma/mv_xor.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index 0cb951b..ea53b87 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1580,11 +1580,6 @@ static int mv_xor_probe(struct platform_device *pdev)
 			int irq;
 
 			cd = &pdata->channels[i];
-			if (!cd) {
-				ret = -ENODEV;
-				goto err_channel_add;
-			}
-
 			irq = platform_get_irq(pdev, i);
 			if (irq < 0) {
 				ret = irq;
-- 
2.10.2

