From: alexander.levin@verizon.com
Date: Sat, 02 Dec 2017 15:51:13 +0000
Subject: [PATCH AUTOSEL for 4.14 01/64] irqchip/qcom: Fix u32 comparison with value less than zero
Message-Id: <20171202155101.7573-1-alexander.levin@verizon.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: Colin Ian King <colin.king@canonical.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, alexander.levin@verizon.com

From: Colin Ian King <colin.king@canonical.com>

[ Upstream commit e9990d70e8a063a7b894c5cbb99f630a0f41200d ]

The comparison of u32 nregs being less than zero is never true since
nregs is unsigned. Fix this by making nregs a signed integer.

Fixes: f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: kernel-janitors@vger.kernel.org
Cc: Jason Cooper <jason@lakedaemon.net>
Link: https://lkml.kernel.org/r/20171117183553.2739-1-colin.king@canonical.com
Signed-off-by: Sasha Levin <alexander.levin@verizon.com>
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
2.11.0
