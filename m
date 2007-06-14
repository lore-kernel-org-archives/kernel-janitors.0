From: vignesh babu <vignesh.babu@wipro.com>
Date: Thu, 14 Jun 2007 10:46:47 +0000
Subject: [KJ] [PATCH]is_power_of_2-net/core/neighbour.c
Message-Id: <1181817288.2474.20.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: roque@di.fc.ul.pt, kuznet@ms2.inr.ac.ru
Cc: netdev@vger.kernel.org, Kernel Janitors List <kernel-janitors@lists.osdl.org>


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index 6f3bb73..e663999 100644
--- a/net/core/neighbour.c
+++ b/net/core/neighbour.c
@@ -33,6 +33,7 @@
 #include <linux/rtnetlink.h>
 #include <linux/random.h>
 #include <linux/string.h>
+#include <linux/log2.h>
 
 #define NEIGH_DEBUG 1
 
@@ -311,7 +312,7 @@ static void neigh_hash_grow(struct neigh_table *tbl, unsigned long new_entries)
 
 	NEIGH_CACHE_STAT_INC(tbl, hash_grows);
 
-	BUG_ON(new_entries & (new_entries - 1));
+	BUG_ON(!is_power_of_2(new_entries));
 	new_hash = neigh_hash_alloc(new_entries);
 	if (!new_hash)
 		return;

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
