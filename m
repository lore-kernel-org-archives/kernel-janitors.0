From: Vignesh Babu BM <vignesh.babu@wipro.com>
Date: Fri, 16 Feb 2007 06:05:47 +0000
Subject: [KJ] [PATCH 3/5] moving to is_power_of_2
Message-Id: <1171605227.27506.78.camel@wriver-t81fb058.linuxcoe>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removing instances of (n&(n-1)) for power of 2 
check with is_power_of_2 from linux/log.h.



Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
 drivers/block/rd.c |    1 +
 fs/nfs/internal.h  |    1 +
 fs/ufs/super.c     |    3 +--
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/block/rd.c b/drivers/block/rd.c
index f73c4a8..e830250 100644
--- a/drivers/block/rd.c
+++ b/drivers/block/rd.c
@@ -56,6 +56,7 @@
 #include <linux/backing-dev.h>
 #include <linux/blkpg.h>
 #include <linux/writeback.h>
+#include <linux/log2.h>
 
 #include <asm/uaccess.h>
 
diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
index 5a1afbb..87b3314 100644
--- a/fs/nfs/internal.h
+++ b/fs/nfs/internal.h
@@ -4,6 +4,7 @@
 
 #include <linux/mount.h>
 #include <linux/log2.h>
+
 struct nfs_string;
 struct nfs_mount_data;
 struct nfs4_mount_data;
diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 0706e4c..275a34b 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -866,8 +866,7 @@ magic_found:
 			uspi->s_fsize);
 		goto failed;
 	}
-	//if (uspi->s_bsize & (uspi->s_bsize - 1)) {
-	if (!isp_power_of_2(uspi->s_bsize)) {
+	if (!is_power_of_2(uspi->s_bsize)) {
 		printk(KERN_ERR "ufs_read_super: block size %u is not a power of 2\n",
 			uspi->s_bsize);
 		goto failed;
-- 
1.4.4.2


-- 
Regards,  
Vignesh Babu BM  
_____________________________________________________________  
"Why is it that every time I'm with you, makes me believe in magic?"
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
