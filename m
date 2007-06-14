From: vignesh babu <vignesh.babu@wipro.com>
Date: Thu, 14 Jun 2007 08:21:42 +0000
Subject: [KJ] [PATCH]is_power_of_2-xfs/xfs_inode.c
Message-Id: <1181808583.2474.12.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/fs/xfs/xfs_inode.c b/fs/xfs/xfs_inode.c
index 3ca5d43..8fdd30d 100644
--- a/fs/xfs/xfs_inode.c
+++ b/fs/xfs/xfs_inode.c
@@ -49,6 +49,7 @@
 #include "xfs_quota.h"
 #include "xfs_acl.h"
 
+#include <linux/log2.h>
 
 kmem_zone_t *xfs_ifork_zone;
 kmem_zone_t *xfs_inode_zone;
@@ -4184,7 +4185,7 @@ xfs_iext_realloc_direct(
 			ifp->if_bytes = new_size;
 			return;
 		}
-		if ((new_size & (new_size - 1)) != 0) {
+		if (!is_power_of_2(new_size)){
 			rnew_size = xfs_iroundup(new_size);
 		}
 		if (rnew_size != ifp->if_real_bytes) {
@@ -4207,7 +4208,7 @@ xfs_iext_realloc_direct(
 	 */
 	else {
 		new_size += ifp->if_bytes;
-		if ((new_size & (new_size - 1)) != 0) {
+		if (!is_power_of_2(new_size)) {
 			rnew_size = xfs_iroundup(new_size);
 		}
 		xfs_iext_inline_to_direct(ifp, rnew_size);

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
