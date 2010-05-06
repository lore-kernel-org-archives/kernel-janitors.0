From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 06 May 2010 09:58:55 +0000
Subject: [PATCH] dmaengine: mpc512x: Use resource_size
Message-Id: <1273139935-26789-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>

Use the resource_size function instead of manually calculating the
resource size.  This reduces the chance of introducing off-by-one
errors.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/dma/mpc512x_dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/dma/mpc512x_dma.c b/drivers/dma/mpc512x_dma.c
index 84326c9..201e6e1 100644
--- a/drivers/dma/mpc512x_dma.c
+++ b/drivers/dma/mpc512x_dma.c
@@ -658,7 +658,7 @@ static int __devinit mpc_dma_probe(struct of_device *op,
 	}
 
 	regs_start = res.start;
-	regs_size = res.end - res.start + 1;
+	regs_size = resource_size(&res);
 
 	if (!devm_request_mem_region(dev, regs_start, regs_size, DRV_NAME)) {
 		dev_err(dev, "Error requesting memory region!\n");
-- 
1.6.3.3

