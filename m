From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 15 Dec 2020 20:07:47 +0000
Subject: [PATCH] irqdomain: Add documentation for irq_create_of_mapping()
Message-Id: <20201215200747.148439-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maz@kernel.org, tglx@linutronix.de, mripard@kernel.org, dan.carpenter@oracle.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Add a description for 'irq_create_of_mapping()' and make explicit the fact
that the resources allocated by this function can be freed by calling
'irq_dispose_mapping()' when needed (i.e. error handling path, remove
function, ...)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The wording can certainly be improved.

My goal is only to make clear if patches such as:
   https://lore.kernel.org/lkml/20201214202117.146293-1-christophe.jaillet@wanadoo.fr/
are needed or not.
---
 kernel/irq/irqdomain.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 6aacd342cd14..d761ece8d43e 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -858,6 +858,15 @@ unsigned int irq_create_fwspec_mapping(struct irq_fwspec *fwspec)
 }
 EXPORT_SYMBOL_GPL(irq_create_fwspec_mapping);
 
+/**
+ * irq_create_of_mapping() - Map an interrupt
+ * @irq_data: structure of_phandle_args returned by a previous
+ * of_irq_parse_xxx() call
+ *
+ * The resources allocated by this function should be freed by
+ * calling irq_dispose_mapping() when the mapping if not useful
+ * anymore.
+ */
 unsigned int irq_create_of_mapping(struct of_phandle_args *irq_data)
 {
 	struct irq_fwspec fwspec;
-- 
2.27.0
