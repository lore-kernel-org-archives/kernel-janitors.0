From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 23 Aug 2014 18:33:25 +0000
Subject: [PATCH 4/7] MIPS: BCM63xx: delete double assignment
Message-Id: <1408818808-18850-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408818808-18850-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1408818808-18850-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete successive assignments to the same location.  In each case, the
duplicated assignment is modified to be in line with other nearby code.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The patches in this series do not depend on each other.

Not compiled.  This patch changes the semantics of the code.

 arch/mips/bcm63xx/irq.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/bcm63xx/irq.c b/arch/mips/bcm63xx/irq.c
index 37eb2d1..b94bf44 100644
--- a/arch/mips/bcm63xx/irq.c
+++ b/arch/mips/bcm63xx/irq.c
@@ -434,7 +434,7 @@ static void bcm63xx_init_irq(void)
 		irq_stat_addr[0] += PERF_IRQSTAT_3368_REG;
 		irq_mask_addr[0] += PERF_IRQMASK_3368_REG;
 		irq_stat_addr[1] = 0;
-		irq_stat_addr[1] = 0;
+		irq_mask_addr[1] = 0;
 		irq_bits = 32;
 		ext_irq_count = 4;
 		ext_irq_cfg_reg1 = PERF_EXTIRQ_CFG_REG_3368;
@@ -443,7 +443,7 @@ static void bcm63xx_init_irq(void)
 		irq_stat_addr[0] += PERF_IRQSTAT_6328_REG(0);
 		irq_mask_addr[0] += PERF_IRQMASK_6328_REG(0);
 		irq_stat_addr[1] += PERF_IRQSTAT_6328_REG(1);
-		irq_stat_addr[1] += PERF_IRQMASK_6328_REG(1);
+		irq_mask_addr[1] += PERF_IRQMASK_6328_REG(1);
 		irq_bits = 64;
 		ext_irq_count = 4;
 		is_ext_irq_cascaded = 1;

