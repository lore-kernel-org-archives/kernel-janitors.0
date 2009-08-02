From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:44:53 +0000
Subject: [PATCH 2/10] arch/powerpc: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0908021044330.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908011052510.23408@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908011052510.23408@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, paulus@samba.org, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 arch/powerpc/sysdev/ipic.c          |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index 69e2630..040144e 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -735,8 +735,10 @@ struct ipic * __init ipic_init(struct device_node *node, unsigned int flags)
 	ipic->irqhost = irq_alloc_host(node, IRQ_HOST_MAP_LINEAR,
 				       NR_IPIC_INTS,
 				       &ipic_host_ops, 0);
-	if (ipic->irqhost = NULL)
+	if (ipic->irqhost = NULL) {
+		kfree(ipic);
 		return NULL;
+	}
 
 	ipic->regs = ioremap(res.start, res.end - res.start + 1);
 
