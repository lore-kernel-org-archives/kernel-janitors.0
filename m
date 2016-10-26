From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 26 Oct 2016 12:22:50 +0000
Subject: [PATCH 4.8 110/140] irqchip/gicv3: Handle loop timeout proper
Message-Id: <20161026122225.094585887@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161026122220.384323763@linuxfoundation.org>
In-Reply-To: <20161026122220.384323763@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>

4.8-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Dan Carpenter <dan.carpenter@oracle.com>

commit d102eb5c1ac5e6743b1c6d145c06a25d98ad1375 upstream.

The timeout loop terminates when the loop count is zero, but the decrement
of the count variable is post check. So count is -1 when we check for the
timeout and therefor the error message is supressed.

Change it to predecrement, so the error message is emitted.

[ tglx: Massaged changelog ]

Fixes: a2c225101234 ("irqchip: gic-v3: Refactor gic_enable_redist to support both enabling and disabling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: kernel-janitors@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>
Link: http://lkml.kernel.org/r/20161014072534.GA15168@mwanda
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/irqchip/irq-gic-v3.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -153,7 +153,7 @@ static void gic_enable_redist(bool enabl
 			return;	/* No PM support in this redistributor */
 	}
 
-	while (count--) {
+	while (--count) {
 		val = readl_relaxed(rbase + GICR_WAKER);
 		if (enable ^ (bool)(val & GICR_WAKER_ChildrenAsleep))
 			break;


