From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Sat, 14 Apr 2007 09:02:11 +0000
Subject: [KJ] [PATCH 04/04]use set_current_state in fs
Message-Id: <20070414085011.GE14084@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, reiserfs-list@namesys.com
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, reiserfs-dev@namesys.com

use set_current_state(TASK_*) instead of current->state = TASK_*, in fs/reiserfs

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---

 journal.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)


diff --git a/fs/reiserfs/journal.c b/fs/reiserfs/journal.c
index 7280a23..864b15a 100644
--- a/fs/reiserfs/journal.c
+++ b/fs/reiserfs/journal.c
@@ -2918,7 +2918,7 @@ static void queue_log_writer(struct super_block *s)
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	if (test_bit(J_WRITERS_QUEUED, &journal->j_state))
 		schedule();
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 	remove_wait_queue(&journal->j_join_wait, &wait);
 }
 

-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
