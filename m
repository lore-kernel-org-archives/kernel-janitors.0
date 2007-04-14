From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Sat, 14 Apr 2007 09:00:19 +0000
Subject: [KJ] [PATCH 02/04]use set_current_state in fs
Message-Id: <20070414084819.GC14084@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, ocfs2-devel@oss.oracle.com
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, mark.fasheh@oracle.com, kurt.hackel@oracle.com


use set_current_state(TASK_*) instead of current->state = TASK_*, in fs/ocfs2

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 dlmthread.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)


diff --git a/fs/ocfs2/dlm/dlmthread.c b/fs/ocfs2/dlm/dlmthread.c
index 2b264c6..26f4474 100644
--- a/fs/ocfs2/dlm/dlmthread.c
+++ b/fs/ocfs2/dlm/dlmthread.c
@@ -76,7 +76,7 @@ repeat:
 		goto repeat;
 	}
 	remove_wait_queue(&res->wq, &wait);
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 }
 
 int __dlm_lockres_has_locks(struct dlm_lock_resource *res)
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
