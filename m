From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2016 07:26:21 +0000
Subject: [patch] irqchip/gicv3: fix a loop timeout
Message-Id: <20161014072534.GA15168@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Sudeep Holla <sudeep.holla@arm.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We expect the loop to exit with "count" set to zero so let's switch it
from a post-op to a pre-op count down.  Otherwise we don't see the error
message when this times out.

Fixes: a2c225101234 ("irqchip: gic-v3: Refactor gic_enable_redist to support both enabling and disabling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 9b81bd8..19d642e 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -153,7 +153,7 @@ static void gic_enable_redist(bool enable)
 			return;	/* No PM support in this redistributor */
 	}
 
-	while (count--) {
+	while (--count) {
 		val = readl_relaxed(rbase + GICR_WAKER);
 		if (enable ^ (bool)(val & GICR_WAKER_ChildrenAsleep))
 			break;
