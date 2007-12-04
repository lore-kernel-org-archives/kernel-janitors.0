From: Julia Lawall <julia@diku.dk>
Date: Tue, 04 Dec 2007 10:10:46 +0000
Subject: [PATCH] arch/powerpc: Add missing of_node_put
Message-Id: <Pine.LNX.4.64.0712041109560.23712@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: olof@lixom.net, paulus@samba.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

There should be an of_node_put when breaking out of a loop that iterates
over calls to of_find_all_nodes, as this function does an of_node_get on
the value it returns.

This was fixed using the following semantic patch.
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
identifier d;
expression e;
@@

T *d;
...
for (d = NULL; (d = of_find_all_nodes(d)) != NULL; )
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

diff -u -p a/arch/powerpc/platforms/iseries/iommu.c b/arch/powerpc/platforms/iseries/iommu.c
--- a/arch/powerpc/platforms/iseries/iommu.c	2007-12-01 17:56:55.000000000 +0100
+++ b/arch/powerpc/platforms/iseries/iommu.c	2007-12-02 16:39:23.000000000 +0100
@@ -163,8 +163,10 @@ static struct iommu_table *iommu_table_f
 		    (it->it_type = TCE_PCI) &&
 		    (it->it_offset = tbl->it_offset) &&
 		    (it->it_index = tbl->it_index) &&
-		    (it->it_size = tbl->it_size))
+		    (it->it_size = tbl->it_size)) {
+			of_node_put(node);
 			return it;
+		}
 	}
 	return NULL;
 }
