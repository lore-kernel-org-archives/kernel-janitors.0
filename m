From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Mar 2019 06:21:37 +0000
Subject: [PATCH v2] irqchip/irq-ls1x: Missing error code in ls1x_intc_of_init()
Message-Id: <20190329062136.GQ32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <a90ad2ff-acc1-0baf-d7e4-1292bb1c8464@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Zyngier <marc.zyngier@arm.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mukesh Ojha <mojha@codeaurora.org>

Currently, when irq_domain_add_linear() fails, the error code does not
get so it returns zero which is wrong.  Fix it by setting appropriate
error code.

Fixes: 9e543e22e204 ("irqchip: Add driver for Loongson-1 interrupt controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
---
V2: Improve the commit message

 drivers/irqchip/irq-ls1x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-ls1x.c b/drivers/irqchip/irq-ls1x.c
index 86b72fbd3b45..353111a10413 100644
--- a/drivers/irqchip/irq-ls1x.c
+++ b/drivers/irqchip/irq-ls1x.c
@@ -130,6 +130,7 @@ static int __init ls1x_intc_of_init(struct device_node *node,
 					     NULL);
 	if (!priv->domain) {
 		pr_err("ls1x-irq: cannot add IRQ domain\n");
+		err = -ENOMEM;
 		goto out_iounmap;
 	}
 
-- 
2.17.1
