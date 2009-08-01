From: Julia Lawall <julia@diku.dk>
Date: Sat, 01 Aug 2009 08:52:51 +0000
Subject: [PATCH 1/10] arch/powerpc/sysdev/qe_lib: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0908011052290.23408@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: timur@freescale.com, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kzalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,f1,l;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...x...+> }
(
x->f1 = E
|
 (x->f1 = NULL || ...)
|
 f(...,x->f1,...)
)
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 arch/powerpc/sysdev/qe_lib/qe_ic.c  |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/sysdev/qe_lib/qe_ic.c b/arch/powerpc/sysdev/qe_lib/qe_ic.c
index 074905c..3faa42e 100644
--- a/arch/powerpc/sysdev/qe_lib/qe_ic.c
+++ b/arch/powerpc/sysdev/qe_lib/qe_ic.c
@@ -339,8 +339,10 @@ void __init qe_ic_init(struct device_node *node, unsigned int flags,
 
 	qe_ic->irqhost = irq_alloc_host(node, IRQ_HOST_MAP_LINEAR,
 					NR_QE_IC_INTS, &qe_ic_host_ops, 0);
-	if (qe_ic->irqhost = NULL)
+	if (qe_ic->irqhost = NULL) {
+		kfree(qe_ic);
 		return;
+	}
 
 	qe_ic->regs = ioremap(res.start, res.end - res.start + 1);
 
@@ -352,6 +354,7 @@ void __init qe_ic_init(struct device_node *node, unsigned int flags,
 
 	if (qe_ic->virq_low = NO_IRQ) {
 		printk(KERN_ERR "Failed to map QE_IC low IRQ\n");
+		kfree(qe_ic);
 		return;
 	}
 
