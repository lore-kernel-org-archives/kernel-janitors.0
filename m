From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Nov 2013 07:51:34 +0000
Subject: [patch] gpio: msm: make msm_gpio.summary_irq signed for error handling
Message-Id: <20131107075134.GI21844@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a bug in msm_gpio_probe() where we do:

	msm_gpio.summary_irq = platform_get_irq(pdev, 0);
	if (msm_gpio.summary_irq < 0) {

The problem is that "msm_gpio.summary_irq" is unsigned so the error
handling doesn't work.  I've fixed it by making it signed.

Fixes: 43f68444bce7 ('gpio: msm: Add device tree and irqdomain support for gpio-msm-v2')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-msm-v2.c b/drivers/gpio/gpio-msm-v2.c
index f7a0cc4..7b37300 100644
--- a/drivers/gpio/gpio-msm-v2.c
+++ b/drivers/gpio/gpio-msm-v2.c
@@ -102,7 +102,7 @@ struct msm_gpio_dev {
 	DECLARE_BITMAP(wake_irqs, MAX_NR_GPIO);
 	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
 	struct irq_domain *domain;
-	unsigned int summary_irq;
+	int summary_irq;
 	void __iomem *msm_tlmm_base;
 };
 
