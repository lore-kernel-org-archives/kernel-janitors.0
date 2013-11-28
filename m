From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 28 Nov 2013 06:18:11 +0000
Subject: [PATCH] kernel/fork.c : remove redundant NULL check in dup_mm()
Message-Id: <1457075.dfc7RuZcNt@daeseok-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From f19c414860a1231460cd3380a7a15f6fb630ef64 Mon Sep 17 00:00:00 2001
From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 28 Nov 2013 10:52:03 +0900
Subject: [PATCH] kernel/fork.c : remove redundant NULL check in dup_mm()

current->mm doesn't need to check NULL in dup_mm().
Becasue dup_mm() is used only in copy_mm() and
current->mm is checked whether it is NULL or not in copy_mm()
before calling dup_mm().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 kernel/fork.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 728d5be..9339bbc 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -804,9 +804,6 @@ struct mm_struct *dup_mm(struct task_struct *tsk)
 	struct mm_struct *mm, *oldmm = current->mm;
 	int err;
 
-	if (!oldmm)
-		return NULL;
-
 	mm = allocate_mm();
 	if (!mm)
 		goto fail_nomem;
-- 
1.7.9.5

---
