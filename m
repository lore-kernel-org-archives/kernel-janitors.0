From: vignesh babu <vignesh.babu@wipro.com>
Date: Thu, 14 Jun 2007 10:46:57 +0000
Subject: [KJ] [PATCH]is_power_of_2-decnet/dn_route.c
Message-Id: <1181817297.2474.21.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/net/decnet/dn_route.c b/net/decnet/dn_route.c
index a8bf106..0a67706 100644
--- a/net/decnet/dn_route.c
+++ b/net/decnet/dn_route.c
@@ -76,6 +76,7 @@
 #include <linux/netfilter_decnet.h>
 #include <linux/rcupdate.h>
 #include <linux/times.h>
+#include <linux/log2.h>
 #include <asm/errno.h>
 #include <net/netlink.h>
 #include <net/neighbour.h>
@@ -1792,7 +1793,7 @@ void __init dn_route_init(void)
 	do {
 		dn_rt_hash_mask = (1UL << order) * PAGE_SIZE /
 			sizeof(struct dn_rt_hash_bucket);
-		while(dn_rt_hash_mask & (dn_rt_hash_mask - 1))
+		while(!is_power_of_2(dn_rt_hash_mask))
 			dn_rt_hash_mask--;
 		dn_rt_hash_table = (struct dn_rt_hash_bucket *)
 			__get_free_pages(GFP_ATOMIC, order);

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
