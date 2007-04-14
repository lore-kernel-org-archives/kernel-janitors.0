From: Milind Arun Choudhary <milindchoudhary@gmail.com>
Date: Sat, 14 Apr 2007 08:59:46 +0000
Subject: [KJ] [PATCH 01/04]use set_current_state in fs
Message-Id: <20070414084746.GB14084@arun.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org, jfs-discussion@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, shaggy@austin.ibm.com


use set_current_state(TASK_*) instead of current->state = TASK_*, in fs/jfs

Signed-off-by: Milind Arun Choudhary <milindchoudhary@gmail.com>

---
 jfs_lock.h   |    2 +-
 jfs_logmgr.c |    4 ++--
 jfs_txnmgr.c |    6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)


diff --git a/fs/jfs/jfs_lock.h b/fs/jfs/jfs_lock.h
index df48ece..9e504bc 100644
--- a/fs/jfs/jfs_lock.h
+++ b/fs/jfs/jfs_lock.h
@@ -45,7 +45,7 @@ do {							\
 		io_schedule();				\
 		lock_cmd;				\
 	}						\
-	current->state = TASK_RUNNING;			\
+	set_current_state(TASK_RUNNING);			\
 	remove_wait_queue(&wq, &__wait);		\
 } while (0)
 
diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 5065baa..9e61514 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -1590,7 +1590,7 @@ void jfs_flush_journal(struct jfs_log *log, int wait)
 		set_current_state(TASK_UNINTERRUPTIBLE);
 		LOGGC_UNLOCK(log);
 		schedule();
-		current->state = TASK_RUNNING;
+		set_current_state(TASK_RUNNING);
 		LOGGC_LOCK(log);
 		remove_wait_queue(&target->gcwait, &__wait);
 	}
@@ -2361,7 +2361,7 @@ int jfsIOWait(void *arg)
 		} else {
 			set_current_state(TASK_INTERRUPTIBLE);
 			schedule();
-			current->state = TASK_RUNNING;
+			set_current_state(TASK_RUNNING);
 		}
 	} while (!kthread_should_stop());
 
diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
index 03893ac..8fe4ced 100644
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -136,7 +136,7 @@ static inline void TXN_SLEEP_DROP_LOCK(wait_queue_head_t * event)
 	set_current_state(TASK_UNINTERRUPTIBLE);
 	TXN_UNLOCK();
 	io_schedule();
-	current->state = TASK_RUNNING;
+	set_current_state(TASK_RUNNING);
 	remove_wait_queue(event, &wait);
 }
 
@@ -2798,7 +2798,7 @@ int jfs_lazycommit(void *arg)
 			set_current_state(TASK_INTERRUPTIBLE);
 			LAZY_UNLOCK(flags);
 			schedule();
-			current->state = TASK_RUNNING;
+			set_current_state(TASK_RUNNING);
 			remove_wait_queue(&jfs_commit_thread_wait, &wq);
 		}
 	} while (!kthread_should_stop());
@@ -2990,7 +2990,7 @@ int jfs_sync(void *arg)
 			set_current_state(TASK_INTERRUPTIBLE);
 			TXN_UNLOCK();
 			schedule();
-			current->state = TASK_RUNNING;
+			set_current_state(TASK_RUNNING);
 		}
 	} while (!kthread_should_stop());
 
-- 
Milind Arun Choudhary
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
