From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Aug 2016 05:30:31 +0000
Subject: [patch] mailbox: bcm-pdc: potential NULL dereference in pdc_shutdown()
Message-Id: <20160804053030.GJ775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Rice <rrice@broadcom.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We can't pass NULL pointers to pdc_ring_free() so I moved the check for
NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mailbox/bcm-pdc-mailbox.c b/drivers/mailbox/bcm-pdc-mailbox.c
index cbe0c1e..c56d4d0 100644
--- a/drivers/mailbox/bcm-pdc-mailbox.c
+++ b/drivers/mailbox/bcm-pdc-mailbox.c
@@ -1191,10 +1191,11 @@ static void pdc_shutdown(struct mbox_chan *chan)
 {
 	struct pdc_state *pdcs = chan->con_priv;
 
-	if (pdcs)
-		dev_dbg(&pdcs->pdev->dev,
-			"Shutdown mailbox channel for PDC %u", pdcs->pdc_idx);
+	if (!pdcs)
+		return;
 
+	dev_dbg(&pdcs->pdev->dev,
+		"Shutdown mailbox channel for PDC %u", pdcs->pdc_idx);
 	pdc_ring_free(pdcs);
 }
 
