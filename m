From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 07 Aug 2018 08:56:03 +0000
Subject: [PATCH] rtmutex: Drop pointless static qualifier in rt_mutex_adjust_prio_chain()
Message-Id: <1533632163-93769-1-git-send-email-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will.deacon@arm.com>
Cc: Mao Wenan <maowenan@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the 'T *v' variable static
since new value always be assigned before use it.

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 kernel/locking/rtmutex.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
index 2823d41..ba70db8 100644
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -472,7 +472,7 @@ static int rt_mutex_adjust_prio_chain(struct task_struct *task,
 	 * We limit the lock chain length for each invocation.
 	 */
 	if (++depth > max_lock_depth) {
-		static int prev_max;
+		int prev_max;
 
 		/*
 		 * Print this only once. If the admin changes the limit,



