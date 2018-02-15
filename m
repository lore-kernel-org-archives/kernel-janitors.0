From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Feb 2018 21:22:16 +0000
Subject: [PATCH] sata_dwc_460ex: Delete an error message for a failed memory allocation in sata_dwc_port_star
Message-Id: <3ba388af-286a-df63-e78f-c82c1d084439@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org, Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Feb 2018 22:15:25 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/ata/sata_dwc_460ex.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 6af4ec3c88c3..ce3d6674ef80 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -901,7 +901,6 @@ static int sata_dwc_port_start(struct ata_port *ap)
 	/* Allocate Port Struct */
 	hsdevp = kzalloc(sizeof(*hsdevp), GFP_KERNEL);
 	if (!hsdevp) {
-		dev_err(ap->dev, "%s: kmalloc failed for hsdevp\n", __func__);
 		err = -ENOMEM;
 		goto CLEANUP;
 	}
-- 
2.16.1

