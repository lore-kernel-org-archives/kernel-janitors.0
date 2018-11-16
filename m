From: Colin King <colin.king@canonical.com>
Date: Fri, 16 Nov 2018 18:42:23 +0000
Subject: [PATCH][i3c-next] i3c: master: fix mask operation by using the correct operator
Message-Id: <20181116184223.28240-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitor Soares <vitor.soares@synopsys.com>, Boris Brezillon <boris.brezillon@bootlin.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The masking operation on status is using a bitwise 'or' rather than
a bitwise 'and' operator, and hence the result is always non-zero
which is probably not what is intended. Fix this by using the correct
operator.

Detected by CoverityScan, CID#1475523 ("Wrong operator used")

Fixes: 88acc98a712a ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/i3c/master/dw-i3c-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 0153e6e9de52..b532e2c9cf5c 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -1085,7 +1085,7 @@ static irqreturn_t dw_i3c_master_irq_handler(int irq, void *dev_id)
 
 	spin_lock(&master->xferqueue.lock);
 	dw_i3c_master_end_xfer_locked(master, status);
-	if (status | INTR_TRANSFER_ERR_STAT)
+	if (status & INTR_TRANSFER_ERR_STAT)
 		writel(INTR_TRANSFER_ERR_STAT, master->regs + INTR_STATUS);
 	spin_unlock(&master->xferqueue.lock);
 
-- 
2.19.1
