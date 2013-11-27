From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Wed, 27 Nov 2013 10:46:26 +0000
Subject: [PATCH v2] kernel/fork.c: make dup_mm() static
Message-Id: <9650251.7MHoDipBHm@daeseok-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From 1e2d6adbdef3d91141ea19a0b3a8660e7fae7847 Mon Sep 17 00:00:00 2001
From: Daeseok Youn <daeseok.youn@lge.com>
Date: Wed, 27 Nov 2013 10:17:59 +0900
Subject: [PATCH v2] kernel/fork.c: make dup_mm() static

dup_mm() function is used only in kernel/fork.c

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 include/linux/sched.h |    2 --
 kernel/fork.c         |    2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 7e35d4b..b04d7b1 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2167,8 +2167,6 @@ extern struct mm_struct *get_task_mm(struct task_struct *task);
 extern struct mm_struct *mm_access(struct task_struct *task, unsigned int mode);
 /* Remove the current tasks stale references to the old mm_struct */
 extern void mm_release(struct task_struct *, struct mm_struct *);
-/* Allocate a new mm structure and copy contents from tsk->mm */
-extern struct mm_struct *dup_mm(struct task_struct *tsk);
 
 extern int copy_thread(unsigned long, unsigned long, unsigned long,
 			struct task_struct *);
diff --git a/kernel/fork.c b/kernel/fork.c
index 022a0af..1603aea 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -799,7 +799,7 @@ void mm_release(struct task_struct *tsk, struct mm_struct *mm)
  * Allocate a new mm structure and copy contents from the
  * mm structure of the passed in task structure.
  */
-struct mm_struct *dup_mm(struct task_struct *tsk)
+static struct mm_struct *dup_mm(struct task_struct *tsk)
 {
 	struct mm_struct *mm, *oldmm = current->mm;
 	int err;
-- 
1.7.9.5

---
