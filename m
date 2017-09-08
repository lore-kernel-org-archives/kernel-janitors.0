From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Sep 2017 15:56:39 +0000
Subject: [PATCH] signal: remove unused variable mask
Message-Id: <20170908155639.4413-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ingo Molnar <mingo@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable mask was introduced by an earlier commit and does not seem
to be used, so remove it.

Fixes gcc warning:
kernel/signal.c:3443:19: warning: unused variable ‘mask’ [-Wunused-variable]

Fixes: fc271087ebcb ("signal: replace sigset_to_compat() with put_compat_sigset()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/signal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 3198a7d2e5ff..36a523640894 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3440,7 +3440,6 @@ COMPAT_SYSCALL_DEFINE4(rt_sigaction, int, sig,
 
 	if (act) {
 		compat_uptr_t handler;
-		compat_sigset_t mask;
 		ret = get_user(handler, &act->sa_handler);
 		new_ka.sa.sa_handler = compat_ptr(handler);
 #ifdef __ARCH_HAS_SA_RESTORER
-- 
2.14.1

