From: Yoann Padioleau <padator@wanadoo.fr>
Date: Fri, 27 Jul 2007 09:47:41 +0000
Subject: [PATCH 19/68] 0 -> NULL, for arch/x86_64
Message-Id: <200707270947.LAA17582@ifs.emn.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: ak@suse.de, discuss@x86-64.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org


When comparing a pointer, it's clearer to compare it to NULL than to 0.

Here is an excerpt of the semantic patch: 

@@
expression *E;
@@

  E =
- 0
+ NULL

@@
expression *E;
@@

  E !- 0
+ NULL

Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
Cc: ak@suse.de
Cc: discuss@x86-64.org
Cc: akpm@linux-foundation.org
---

 numa.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86_64/mm/numa.c b/arch/x86_64/mm/numa.c
index 6da2355..97e8ac7 100644
--- a/arch/x86_64/mm/numa.c
+++ b/arch/x86_64/mm/numa.c
@@ -166,7 +166,7 @@ early_node_mem(int nodeid, unsigned long
 		return __va(mem);
 	ptr = __alloc_bootmem_nopanic(size,
 				SMP_CACHE_BYTES, __pa(MAX_DMA_ADDRESS));
-	if (ptr = 0) {
+	if (ptr = NULL) {
 		printk(KERN_ERR "Cannot find %lu bytes in node %d\n",
 			size, nodeid);
 		return NULL;

