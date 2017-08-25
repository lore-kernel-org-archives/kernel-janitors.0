From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 12:14:09 +0000
Subject: [PATCH v3] irqdomain: Prevent Oops in irq_domain_push_irq()
Message-Id: <20170825121409.6rfv4vt6ztz2oqkt@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Zyngier <marc.zyngier@arm.com>, David Daney <david.daney@cavium.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code generates a Smatch warning:

	kernel/irq/irqdomain.c:1511 irq_domain_push_irq()
	warn: variable dereferenced before check 'root_irq_data' (see line 1508)

irq_get_irq_data() does sometimes return NULL pointers so this seems
like a real bug.  Let's fix this bug by moving the check for NULL
earlier.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Redo changelog.
v3: Redo changelog again.  Make it imperative.

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
