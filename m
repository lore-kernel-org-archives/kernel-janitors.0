From: Cyril Roelandt <tipecaml@gmail.com>
Date: Thu, 16 May 2013 16:06:20 +0000
Subject: [PATCH] staging: lustre: fix return type of lo_release.
Message-Id: <1368720380-20974-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, andreas.dilger@intel.com, tao.peng@emc.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc: Cyril Roelandt <tipecaml@gmail.com>

The return type of block_device_operations.release() changed to void in commit
db2a144b.

Found with the following Coccinelle patch:
<smpl>
@has_release_func@
identifier i;
identifier release_func;
@@
struct block_device_operations i = {
 .release = release_func
};

@depends on has_release_func@
identifier has_release_func.release_func;
@@
- int
+ void
release_func(...) {
...
- return ...;
}
</smpl>

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/lustre/lustre/llite/lloop.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/lloop.c b/drivers/staging/lustre/lustre/llite/lloop.c
index b72f257..9d4c17e 100644
--- a/drivers/staging/lustre/lustre/llite/lloop.c
+++ b/drivers/staging/lustre/lustre/llite/lloop.c
@@ -596,15 +596,13 @@ static int lo_open(struct block_device *bdev, fmode_t mode)
 	return 0;
 }
 
-static int lo_release(struct gendisk *disk, fmode_t mode)
+static void lo_release(struct gendisk *disk, fmode_t mode)
 {
 	struct lloop_device *lo = disk->private_data;
 
 	mutex_lock(&lo->lo_ctl_mutex);
 	--lo->lo_refcnt;
 	mutex_unlock(&lo->lo_ctl_mutex);
-
-	return 0;
 }
 
 /* lloop device node's ioctl function. */
-- 
1.7.10.4

