From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 17 Dec 2018 11:58:18 +0000
Subject: [PATCH -next] irqchip: irq-rda-intc: Fix return value check in rda8810_intc_init()
Message-Id: <1545047898-153890-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function of_io_request_and_map() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: d852e62ad689 ("irqchip: Add RDA8810PL interrupt driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/irqchip/irq-rda-intc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-rda-intc.c b/drivers/irqchip/irq-rda-intc.c
index 1176291..9601683 100644
--- a/drivers/irqchip/irq-rda-intc.c
+++ b/drivers/irqchip/irq-rda-intc.c
@@ -85,8 +85,8 @@ static int __init rda8810_intc_init(struct device_node *node,
 				    struct device_node *parent)
 {
 	rda_intc_base = of_io_request_and_map(node, 0, "rda-intc");
-	if (!rda_intc_base)
-		return -ENXIO;
+	if (IS_ERR(rda_intc_base))
+		return PTR_ERR(rda_intc_base);
 
 	/* Mask all interrupt sources */
 	writel_relaxed(RDA_IRQ_MASK_ALL, rda_intc_base + RDA_INTC_MASK_CLR);
