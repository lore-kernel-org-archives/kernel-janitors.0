From: Colin King <colin.king@canonical.com>
Date: Fri, 17 Nov 2017 18:35:53 +0000
Subject: [PATCH] irqchip/qcom: fix u32 comparison with value less than zero
Message-Id: <20171117183553.2739-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The comparison of u32 nregs being less than zero is never true since
nregs is unsigned. Fix this by making nregs a signed integer.

Fixes: f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/irqchip/qcom-irq-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index 6aa3ea479214..f31265937439 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -238,7 +238,7 @@ static int __init combiner_probe(struct platform_device *pdev)
 {
 	struct combiner *combiner;
 	size_t alloc_sz;
-	u32 nregs;
+	int nregs;
 	int err;
 
 	nregs = count_registers(pdev);
-- 
2.14.1

