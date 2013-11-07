From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 07:49:19 +0000
Subject: [patch] mailbox/omap: make mbox->irq signed for error handling
Message-Id: <20131107074918.GG21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Omar Ramirez Luna <omar.ramirez@copitl.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a bug in omap2_mbox_probe() where we try do:

		mbox->irq = platform_get_irq(pdev, info->irq_id);
		if (mbox->irq < 0) {

The problem is that mbox->irq is unsigned so the error handling doesn't
work.  I've changed it to a signed integer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mailbox/omap-mbox.h b/drivers/mailbox/omap-mbox.h
index 6cd38fc..86d7518 100644
--- a/drivers/mailbox/omap-mbox.h
+++ b/drivers/mailbox/omap-mbox.h
@@ -52,7 +52,7 @@ struct omap_mbox_queue {
 
 struct omap_mbox {
 	const char		*name;
-	unsigned int		irq;
+	int			irq;
 	struct omap_mbox_queue	*txq, *rxq;
 	struct omap_mbox_ops	*ops;
 	struct device		*dev;
