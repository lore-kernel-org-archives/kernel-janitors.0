From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 06 May 2010 08:12:20 +0000
Subject: [PATCH] net: emaclite: Use resource_size
Message-Id: <1273133540-6894-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, davem@davemloft.net
Cc: john.linn@xilinx.com, kernel-janitors@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>

Use the resource_size function instead of manually calculating the
resource size.  This reduces the chance of introducing off-by-one
errors.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/net/xilinx_emaclite.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xilinx_emaclite.c b/drivers/net/xilinx_emaclite.c
index e9381fe..93828d5 100644
--- a/drivers/net/xilinx_emaclite.c
+++ b/drivers/net/xilinx_emaclite.c
@@ -1171,7 +1171,7 @@ static int __devinit xemaclite_of_probe(struct of_device *ofdev,
 	}
 
 	/* Get the virtual base address for the device */
-	lp->base_addr = ioremap(r_mem.start, r_mem.end - r_mem.start + 1);
+	lp->base_addr = ioremap(r_mem.start, resource_size(&r_mem));
 	if (NULL = lp->base_addr) {
 		dev_err(dev, "EmacLite: Could not allocate iomem\n");
 		rc = -EIO;
@@ -1224,7 +1224,7 @@ static int __devinit xemaclite_of_probe(struct of_device *ofdev,
 	return 0;
 
 error1:
-	release_mem_region(ndev->mem_start, r_mem.end - r_mem.start + 1);
+	release_mem_region(ndev->mem_start, resource_size(&r_mem));
 
 error2:
 	xemaclite_remove_ndev(ndev);
-- 
1.6.3.3

