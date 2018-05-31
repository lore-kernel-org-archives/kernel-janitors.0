From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 May 2018 06:24:24 +0000
Subject: [PATCH] gpio: dwapb: fix a signedness bug handling IRQs
Message-Id: <20180531062424.3pfqikwzxryi6teu@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hoan Tran <hotran@apm.com>, Phil Edworthy <phil.edworthy@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch flags a couple bugs here:

drivers/gpio/gpio-dwapb.c:447 dwapb_configure_irqs() warn: always true condition '(pp->irq[i] >= 0) => (0-u32max >= 0)'
drivers/gpio/gpio-dwapb.c:627 dwapb_gpio_get_pdata() warn: always true condition '(pp->irq[j] >= 0) => (0-u32max >= 0)'

The problem is that we're storing error codes in pp->irq[] so it needs
to be signed for the error handling to work correctly.

Fixes: da069d5d2b81 ("gpio: dwapb: Rework support for 1 interrupt per port A GPIO")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
index 5a52d69c13f3..419cfacb4b42 100644
--- a/include/linux/platform_data/gpio-dwapb.h
+++ b/include/linux/platform_data/gpio-dwapb.h
@@ -19,7 +19,7 @@ struct dwapb_port_property {
 	unsigned int	idx;
 	unsigned int	ngpio;
 	unsigned int	gpio_base;
-	unsigned int	irq[32];
+	int		irq[32];
 	bool		has_irq;
 	bool		irq_shared;
 };
