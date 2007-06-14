From: vignesh babu <vignesh.babu@wipro.com>
Date: Thu, 14 Jun 2007 08:21:18 +0000
Subject: [KJ] [PATCH]is_power_of_2-ufs/super.c
Message-Id: <1181808559.2474.9.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel.pirkl@email.cz, dushistov@mail.ru
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Kernel Janitors List <kernel-janitors@lists.osdl.org>


Replacing (n & (n-1)) in the context of power of 2 checks
with is_power_of_2

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
--- 
diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 22ff6ed..2b30116 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -87,6 +87,7 @@
 #include <linux/smp_lock.h>
 #include <linux/buffer_head.h>
 #include <linux/vfs.h>
+#include <linux/log2.h>
 
 #include "swab.h"
 #include "util.h"
@@ -854,7 +855,7 @@ magic_found:
 	uspi->s_fmask = fs32_to_cpu(sb, usb1->fs_fmask);
 	uspi->s_fshift = fs32_to_cpu(sb, usb1->fs_fshift);
 
-	if (uspi->s_fsize & (uspi->s_fsize - 1)) {
+	if (!is_power_of_2(uspi->s_fsize)) {
 		printk(KERN_ERR "ufs_read_super: fragment size %u is not a power of 2\n",
 			uspi->s_fsize);
 			goto failed;
@@ -869,7 +870,7 @@ magic_found:
 			uspi->s_fsize);
 		goto failed;
 	}
-	if (uspi->s_bsize & (uspi->s_bsize - 1)) {
+	if (!is_power_of_2(uspi->s_bsize)) {
 		printk(KERN_ERR "ufs_read_super: block size %u is not a power of 2\n",
 			uspi->s_bsize);
 		goto failed;

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
