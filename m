From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Wed, 02 Jul 2014 19:51:58 +0000
Subject: [PATCH] Block: rsxx: core: Removed depricated flag IRQF_DISABLED
Message-Id: <1404329998-30640-1-git-send-email-kumargauravgupta3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: josh.h.morris@us.ibm.com, pjk1939@linux.vnet.ibm.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Kumar Gaurav <kumargauravgupta3@gmail.com>

IRQF_DISABLED flag is depricated and should be removed.

Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>
---
 drivers/block/rsxx/core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
index a8de2ee..ddb6b2b 100644
--- a/drivers/block/rsxx/core.c
+++ b/drivers/block/rsxx/core.c
@@ -886,7 +886,7 @@ static int rsxx_pci_probe(struct pci_dev *dev,
 				"Failed to enable MSI\n");
 	}
 
-	st = request_irq(dev->irq, rsxx_isr, IRQF_DISABLED | IRQF_SHARED,
+	st = request_irq(dev->irq, rsxx_isr, IRQF_SHARED,
 			 DRIVER_NAME, card);
 	if (st) {
 		dev_err(CARD_TO_DEV(card),
-- 
1.7.9.5

