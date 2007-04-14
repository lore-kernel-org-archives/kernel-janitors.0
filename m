From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Sat, 14 Apr 2007 09:01:56 +0000
Subject: [KJ] [PATCH 03/04]use set_current_state in fs
Message-Id: <20070414084956.GD14084@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, nfs@lists.sourceforge.net
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, trond.myklebust@fys.uio.no

use set_current_state(TASK_*) instead of current->state = TASK_*, in fs/nfs

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>


---
 idmap.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/idmap.c b/fs/nfs/idmap.c
index 9d4a6b2..054ca15 100644
--- a/fs/nfs/idmap.c
+++ b/fs/nfs/idmap.c
@@ -272,7 +272,7 @@ nfs_idmap_id(struct idmap *idmap, struct idmap_hashtable *h,
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	mutex_unlock(&idmap->idmap_im_lock);
 	schedule();
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&idmap->idmap_wq, &wq);
 	mutex_lock(&idmap->idmap_im_lock);
 
@@ -333,7 +333,7 @@ nfs_idmap_name(struct idmap *idmap, struct idmap_hashtable *h,
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	mutex_unlock(&idmap->idmap_im_lock);
 	schedule();
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&idmap->idmap_wq, &wq);
 	mutex_lock(&idmap->idmap_im_lock);
 
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
