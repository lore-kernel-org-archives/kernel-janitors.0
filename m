From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 07:13:37 +0000
Subject: [PATCH] irqdomain: check for NULL before dereferencing
Message-Id: <20170825071337.g72afdd5pdqjshon@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Zyngier <marc.zyngier@arm.com>, David Daney <david.daney@cavium.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I reversed these two checks so we check "root_irq_data" for NULL before
dereferencing it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index b9c688944429..e84b7056bb08 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1505,10 +1505,10 @@ int irq_domain_push_irq(struct irq_domain *domain, int virq, void *arg)
 	if (WARN_ON(!irq_domain_is_hierarchy(domain)))
 		return -EINVAL;
 
-	if (domain->parent != root_irq_data->domain)
+	if (!root_irq_data)
 		return -EINVAL;
 
-	if (!root_irq_data)
+	if (domain->parent != root_irq_data->domain)
 		return -EINVAL;
 
 	child_irq_data = kzalloc_node(sizeof(*child_irq_data), GFP_KERNEL,
