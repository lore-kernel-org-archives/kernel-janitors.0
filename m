From: vignesh babu <vignesh.babu@wipro.com>
Date: Thu, 07 Jun 2007 10:09:50 +0000
Subject: [KJ][PATCH]is_power_of_2-drm/drm_bufs.c
Message-Id: <1181210270.11218.4.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/drivers/char/drm/drm_bufs.c b/drivers/char/drm/drm_bufs.c
index c113458..f6c35a3 100644
--- a/drivers/char/drm/drm_bufs.c
+++ b/drivers/char/drm/drm_bufs.c
@@ -34,6 +34,7 @@
  */
 
 #include <linux/vmalloc.h>
+#include <linux/log2.h>
 #include "drmP.h"
 
 unsigned long drm_get_resource_start(drm_device_t *dev, unsigned int resource)
@@ -1653,7 +1654,7 @@ int drm_order(unsigned long size)
 
 	for (order = 0, tmp = size >> 1; tmp; tmp >>= 1, order++) ;
 
-	if (size & (size - 1))
+	if (!is_power_of_2(size))
 		++order;
 
 	return order;

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
