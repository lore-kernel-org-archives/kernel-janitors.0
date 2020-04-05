From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 05 Apr 2020 13:16:01 +0000
Subject: [PATCH] mailbox: ZynqMP IPI: Delete an error message in zynqmp_ipi_probe()
Message-Id: <28699a47-7770-7ce2-69fa-183a98c368b8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org, Jassi Brar <jassisinghbrar@gmail.com>, Michal Simek <michal.simek@xilinx.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 5 Apr 2020 15:10:16 +0200

The function “platform_get_irq” can log an error already.
Thus omit a redundant message for the exception handling in the
calling function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index 86887c9a349a..a4d176f160b8 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -668,10 +668,9 @@ static int zynqmp_ipi_probe(struct platform_device *pdev)

 	/* IPI IRQ */
 	ret = platform_get_irq(pdev, 0);
-	if (ret < 0) {
-		dev_err(dev, "unable to find IPI IRQ.\n");
+	if (ret < 0)
 		goto free_mbox_dev;
-	}
+
 	pdata->irq = ret;
 	ret = devm_request_irq(dev, pdata->irq, zynqmp_ipi_interrupt,
 			       IRQF_SHARED, dev_name(dev), pdata);
--
2.26.0
