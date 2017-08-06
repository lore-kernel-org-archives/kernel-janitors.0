From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 06 Aug 2017 09:20:11 +0000
Subject: [PATCH] ATM-ENI: Delete an error message for a failed memory allocation in eni_start()
Message-Id: <da947bfe-8bef-18c4-609c-e859412dd2f3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, Chas Williams <3chas3@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 6 Aug 2017 11:15:17 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/atm/eni.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/atm/eni.c b/drivers/atm/eni.c
index ce47eb17901d..d4b11ef940ee 100644
--- a/drivers/atm/eni.c
+++ b/drivers/atm/eni.c
@@ -1849,8 +1849,6 @@ static int eni_start(struct atm_dev *dev)
 					   sizeof(*eni_dev->free_list),
 					   GFP_KERNEL);
 	if (!eni_dev->free_list) {
-		printk(KERN_ERR DEV_LABEL "(itf %d): couldn't get free page\n",
-		    dev->number);
 		error = -ENOMEM;
 		goto free_irq;
 	}
-- 
2.13.4

