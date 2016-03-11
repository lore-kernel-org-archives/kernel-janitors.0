From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Mar 2016 08:14:43 +0000
Subject: [patch] irqchip: irq-alpine-msi: releasing the wrong variable on error
Message-Id: <20160311081442.GE31887@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "msi_domain" variable is NULL here so it leads to a NULL
dereference.  It looks like we actually intended to free
"middle_domain".

Fixes: e6b78f2c3e14 ('irqchip: Add the Alpine MSIX interrupt controller')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index f871272..2538425 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -220,7 +220,7 @@ static int alpine_msix_init_domains(struct alpine_msix_data *priv,
 					       middle_domain);
 	if (!msi_domain) {
 		pr_err("Failed to create MSI domain\n");
-		irq_domain_remove(msi_domain);
+		irq_domain_remove(middle_domain);
 		return -ENOMEM;
 	}
 
