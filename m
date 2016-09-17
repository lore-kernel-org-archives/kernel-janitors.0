From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 17 Sep 2016 15:15:15 +0000
Subject: [PATCH 07/24] ste_dma40: Use kmalloc_array() in d40_hw_detect_init()
Message-Id: <b49715cb-0150-9d30-a79f-198adad8944a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <92810066-69b6-94e7-dcec-a28594b1328f@users.sourceforge.net>
In-Reply-To: <92810066-69b6-94e7-dcec-a28594b1328f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 17 Sep 2016 11:44:55 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected also by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dma/ste_dma40.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index b5d15a1..f813056 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -3299,9 +3299,9 @@ static struct d40_base * __init d40_hw_detect_init(struct platform_device *pdev)
 	if (!base->lookup_log_chans)
 		goto failure;
 
-	base->reg_val_backup_chan = kmalloc(base->num_phy_chans *
-					    sizeof(d40_backup_regs_chan),
-					    GFP_KERNEL);
+	base->reg_val_backup_chan = kmalloc_array(base->num_phy_chans,
+						  sizeof(d40_backup_regs_chan),
+						  GFP_KERNEL);
 	if (!base->reg_val_backup_chan)
 		goto failure;
 
-- 
2.10.0

