From: Colin King <colin.king@canonical.com>
Date: Sat, 11 May 2019 13:18:49 +0000
Subject: [PATCH] sched: remove redundant assignment to variable utime
Message-Id: <20190511131849.4513-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401027811-30066-1-git-send-email-giedrius.rekasius@gmail.com>
In-Reply-To: <1401027811-30066-1-git-send-email-giedrius.rekasius@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable utime is being assigned a value however this is never
read and later it is being reassigned to a new value. The assignment
is redundant and hence can be removed.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/sched/cputime.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index ba4a143bdcf3..ad647711ffb8 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -616,10 +616,8 @@ void cputime_adjust(struct task_cputime *curr, struct prev_cputime *prev,
 	 * Once a task gets some ticks, the monotonicy code at 'update:'
 	 * will ensure things converge to the observed ratio.
 	 */
-	if (stime = 0) {
-		utime = rtime;
+	if (stime = 0)
 		goto update;
-	}
 
 	if (utime = 0) {
 		stime = rtime;
-- 
2.20.1
