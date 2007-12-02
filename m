From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Dec 2007 20:04:05 +0000
Subject: [PATCH 1/3] arch/powerpc: Add missing of_node_put
Message-Id: <Pine.LNX.4.64.0712022101010.3361@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benh@kernel.crashing.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

There should be an of_node_put when breaking out of a loop that iterates
using for_each_node_by_type.

This was detected and fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
identifier d;
type T;
expression e;
iterator for_each_node_by_type;
@@

T *d;
...
for_each_node_by_type(d,...)
  {... when != of_node_put(d)
       when != e = d
(
   return d;
|
+  of_node_put(d);
?  return ...;
)
...}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/arch/powerpc/platforms/cell/cbe_regs.c b/arch/powerpc/platforms/cell/cbe_regs.c
--- a/arch/powerpc/platforms/cell/cbe_regs.c 2007-10-22 11:24:59.000000000 +0200
+++ b/arch/powerpc/platforms/cell/cbe_regs.c 2007-12-02 17:40:26.000000000 +0100
@@ -256,6 +256,7 @@ void __init cbe_regs_init(void)
 			printk(KERN_ERR "cbe_regs: More BE chips than supported"
 			       "!\n");
 			cbe_regs_map_count--;
+			of_node_put(cpu);
 			return;
 		}
 		map->cpu_node = cpu;
