From: santosh nayak <santoshprasadnayak@gmail.com>
Date: Fri, 02 Mar 2012 15:21:05 +0000
Subject: [PATCH 1/3] qla3xxx: ethernet: Fix bogus interrupt state flag.
Message-Id: <1330700945-18195-1-git-send-email-santoshprasadnayak@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jitendra.kalsaria@qlogic.com
Cc: ron.mercer@qlogic.com, linux-driver@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Santosh Nayak <santoshprasadnayak@gmail.com>

From: Santosh Nayak <santoshprasadnayak@gmail.com>

In 'ql_adapter_initialize'
the first call for 'spin_unlock_irqrestore()' is with hw_flags = 0,
which is as good as 'spin_unlock_irq()' (unconditional interrupt
enabling). If this is intended, then for better performance
'spin_unlock_irqrestore()' can be replaced with 'spin_unlock_irq()'
and 'spin_lock_irqsave()' can be replaced by 'spin_lock_irq()

Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
---
 drivers/net/ethernet/qlogic/qla3xxx.c |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qla3xxx.c b/drivers/net/ethernet/qlogic/qla3xxx.c
index d49f6da..8da3e41 100644
--- a/drivers/net/ethernet/qlogic/qla3xxx.c
+++ b/drivers/net/ethernet/qlogic/qla3xxx.c
@@ -3017,7 +3017,6 @@ static int ql_adapter_initialize(struct ql3_adapter *qdev)
 		(void __iomem *)port_regs;
 	u32 delay = 10;
 	int status = 0;
-	unsigned long hw_flags = 0;
 
 	if (ql_mii_setup(qdev))
 		return -1;
@@ -3228,9 +3227,9 @@ static int ql_adapter_initialize(struct ql3_adapter *qdev)
 		value = ql_read_page0_reg(qdev, &port_regs->portStatus);
 		if (value & PORT_STATUS_IC)
 			break;
-		spin_unlock_irqrestore(&qdev->hw_lock, hw_flags);
+		spin_unlock_irq(&qdev->hw_lock);
 		msleep(500);
-		spin_lock_irqsave(&qdev->hw_lock, hw_flags);
+		spin_lock_irq(&qdev->hw_lock);
 	} while (--delay);
 
 	if (delay = 0) {
-- 
1.7.4.4

