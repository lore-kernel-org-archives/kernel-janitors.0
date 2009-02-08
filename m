From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 08 Feb 2009 19:24:47 +0000
Subject: [PATCH] kernel/irq: fix sparse warning: make symbol static
Message-Id: <20090208192405.8084.89231.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

While being at it make every occurrence of 'do_irq_select_affinity'
have the same signature in terms of signedness of the first argument.

Fix this sparse warning:
  kernel/irq/manage.c:112:5: warning: symbol 'do_irq_select_affinity' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 kernel/irq/manage.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index a3a5dc9..1bdcb59 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -109,7 +109,7 @@ int irq_set_affinity(unsigned int irq, const struct cpumask *cpumask)
 /*
  * Generic version of the affinity autoselector.
  */
-int do_irq_select_affinity(unsigned int irq, struct irq_desc *desc)
+static int do_irq_select_affinity(unsigned int irq, struct irq_desc *desc)
 {
 	if (!irq_can_set_affinity(irq))
 		return 0;
@@ -156,7 +156,7 @@ int irq_select_affinity_usr(unsigned int irq)
 }
 
 #else
-static inline int do_irq_select_affinity(int irq, struct irq_desc *desc)
+static inline int do_irq_select_affinity(unsigned int irq, struct irq_desc *desc)
 {
 	return 0;
 }

