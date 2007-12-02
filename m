From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Dec 2007 20:05:24 +0000
Subject: [PATCH 2/3] arch/sparc: Add missing of_node_put
Message-Id: <Pine.LNX.4.64.0712022104110.3361@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wli@holomorphy.com, davem@davemloft.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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

diff -u -p a/arch/sparc/kernel/devices.c b/arch/sparc/kernel/devices.c
--- a/arch/sparc/kernel/devices.c	2006-11-30 19:04:17.000000000 +0100
+++ b/arch/sparc/kernel/devices.c	2007-12-02 17:57:39.000000000 +0100
@@ -62,8 +62,10 @@ static int __cpu_find_by(int (*compare)(
 		int err = check_cpu_node(dp->node, &cur_inst,
 					 compare, compare_arg,
 					 prom_node, mid);
-		if (!err)
+		if (!err) {			 
+			of_node_put(dp);
 			return 0;
+		}
 	}
 
 	return -ENODEV;
