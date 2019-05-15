From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2019 09:31:41 +0000
Subject: [PATCH] mfd: stmfx: Uninitialized variable in stmfx_irq_handler()
Message-Id: <20190515093141.GA3409@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Amelie Delaunay <amelie.delaunay@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem is that on 64bit systems then we don't clear the higher
bits of the "pending" variable.  So when we do:

	ack = pending & ~BIT(STMFX_REG_IRQ_SRC_EN_GPIO);
	if (ack) {

the if (ack) condition relies on uninitialized data.  The fix it that
I've changed "pending" from an unsigned long to a u32.  I changed "n" as
well, because that's a number in the 0-10 range and it fits easily
inside an int.  We do need to add a cast to "pending" when we use it in
the for_each_set_bit() loop, but that doesn't cause a proble, it's
fine.

Fixes: 06252ade9156 ("mfd: Add ST Multi-Function eXpander (STMFX) core driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mfd/stmfx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
index fe8efba2d45f..fee75b5d098e 100644
--- a/drivers/mfd/stmfx.c
+++ b/drivers/mfd/stmfx.c
@@ -204,12 +204,12 @@ static struct irq_chip stmfx_irq_chip = {
 static irqreturn_t stmfx_irq_handler(int irq, void *data)
 {
 	struct stmfx *stmfx = data;
-	unsigned long n, pending;
+	u32 pending;
 	u32 ack;
+	int n;
 	int ret;
 
-	ret = regmap_read(stmfx->map, STMFX_REG_IRQ_PENDING,
-			  (u32 *)&pending);
+	ret = regmap_read(stmfx->map, STMFX_REG_IRQ_PENDING, &pending);
 	if (ret)
 		return IRQ_NONE;
 
@@ -224,7 +224,7 @@ static irqreturn_t stmfx_irq_handler(int irq, void *data)
 			return IRQ_NONE;
 	}
 
-	for_each_set_bit(n, &pending, STMFX_REG_IRQ_SRC_MAX)
+	for_each_set_bit(n, (unsigned long *)&pending, STMFX_REG_IRQ_SRC_MAX)
 		handle_nested_irq(irq_find_mapping(stmfx->irq_domain, n));
 
 	return IRQ_HANDLED;
-- 
2.20.1
