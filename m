From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Mar 2016 08:11:39 +0000
Subject: [patch] mfd: lp8788-irq: uninitialized variable in irq handler
Message-Id: <20160311081139.GC31887@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milo Kim <milo.kim@ti.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Instead to being true/false, the "handled" is true/uninitialized.
Presumably this doesn't cause that many problems in real life because
normally we handle the IRQ.

Fixes: eea6b7cc53aa ('mfd: Add lp8788 mfd driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mfd/lp8788-irq.c b/drivers/mfd/lp8788-irq.c
index c7a9825..792d51b 100644
--- a/drivers/mfd/lp8788-irq.c
+++ b/drivers/mfd/lp8788-irq.c
@@ -112,7 +112,7 @@ static irqreturn_t lp8788_irq_handler(int irq, void *ptr)
 	struct lp8788_irq_data *irqd = ptr;
 	struct lp8788 *lp = irqd->lp;
 	u8 status[NUM_REGS], addr, mask;
-	bool handled;
+	bool handled = false;
 	int i;
 
 	if (lp8788_read_multi_bytes(lp, LP8788_INT_1, status, NUM_REGS))
