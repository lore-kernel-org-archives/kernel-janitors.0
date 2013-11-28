From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 28 Nov 2013 05:49:11 +0000
Subject: [PATCH] kernel/fork.c : fix coding style issues
Message-Id: <1579476.AWLPZBjh3G@daeseok-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11646966.nLE5LGqd3A@daeseok-laptop>
In-Reply-To: <11646966.nLE5LGqd3A@daeseok-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From cdc59c7b26d6ff238e9ab7e27f0d0182e3e73875 Mon Sep 17 00:00:00 2001
From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 28 Nov 2013 10:19:58 +0900
Subject: [PATCH] kernel/fork.c : fix coding style issues

This patch fixes the following errors reported by checkpatch.pl.
One of errors is parentheses, another is whitespace issue.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 kernel/fork.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 728d5be..56824f1 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -1644,7 +1644,7 @@ SYSCALL_DEFINE0(fork)
 	return do_fork(SIGCHLD, 0, 0, NULL, NULL);
 #else
 	/* can not support in nommu mode */
-	return(-EINVAL);
+	return -EINVAL;
 #endif
 }
 #endif
@@ -1652,7 +1652,7 @@ SYSCALL_DEFINE0(fork)
 #ifdef __ARCH_WANT_SYS_VFORK
 SYSCALL_DEFINE0(vfork)
 {
-	return do_fork(CLONE_VFORK | CLONE_VM | SIGCHLD, 0, 
+	return do_fork(CLONE_VFORK | CLONE_VM | SIGCHLD, 0,
 			0, NULL, NULL);
 }
 #endif
-- 
1.7.9.5

---
