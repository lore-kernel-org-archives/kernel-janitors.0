From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 13:15:13 +0000
Subject: [kj] is_power_of_2 in mm/slub.c
Message-Id: <1187010193.7273.15.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: clameter@sgi.com
Cc: linux-mm@kvack.org, linux-kernel <linux-kernel@vger.kernel.org>, Kernel Janitors List <kernel-janitors@lists.osdl.org>

Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
diff --git a/mm/slub.c b/mm/slub.c
index 69d02e3..1241d14 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -20,6 +20,7 @@
 #include <linux/mempolicy.h>
 #include <linux/ctype.h>
 #include <linux/kallsyms.h>
+#include <linux/log2.h>
 
 /*
  * Lock order:
@@ -2606,7 +2607,7 @@ void __init kmem_cache_init(void)
 	 * around with ARCH_KMALLOC_MINALIGN
 	 */
 	BUILD_BUG_ON(KMALLOC_MIN_SIZE > 256 ||
-		(KMALLOC_MIN_SIZE & (KMALLOC_MIN_SIZE - 1)));
+		!is_power_of_2(KMALLOC_MIN_SIZE));
 
 	for (i = 8; i < KMALLOC_MIN_SIZE; i += 8)
 		size_index[(i - 1) / 8] = KMALLOC_SHIFT_LOW;

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
