From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 15:25:35 +0000
Subject: [PATCH] block-sx8: Delete an error message for a failed memory allocation in carm_init_one()
Message-Id: <e28e8cff-107d-4aca-cce2-43001f95e445@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@fb.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 17:14:21 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/sx8.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/block/sx8.c b/drivers/block/sx8.c
index 08586dc14e85..4b1800f6724d 100644
--- a/drivers/block/sx8.c
+++ b/drivers/block/sx8.c
@@ -1605,8 +1605,6 @@ static int carm_init_one (struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	host = kzalloc(sizeof(*host), GFP_KERNEL);
 	if (!host) {
-		printk(KERN_ERR DRV_NAME "(%s): memory alloc failure\n",
-		       pci_name(pdev));
 		rc = -ENOMEM;
 		goto err_out_regions;
 	}
-- 
2.13.4

