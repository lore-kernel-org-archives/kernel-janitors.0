From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 13:15:47 +0000
Subject: [kj] is_power_of_2 in net/core/neighbour.c
Message-Id: <1187010227.7273.16.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: roque@di.fc.ul.pt, kuznet@ms2.inr.ac.ru, netdev@vger.kernel.org
Cc: Kernel Janitors List <kernel-janitors@lists.osdl.org>

Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
diff --git a/net/core/neighbour.c b/net/core/neighbour.c
index ca2a153..f7de8f2 100644
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
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
