From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 02 Jun 2020 19:50:02 +0000
Subject: [PATCH] sched/deadline: Fix a typo in a comment
Message-Id: <20200602195002.677448-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/deadine/deadline/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 kernel/sched/deadline.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 504d2f51b0d6..cc2066e25dcf 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1098,7 +1098,7 @@ void init_dl_task_timer(struct sched_dl_entity *dl_se)
  * cannot use the runtime, and so it replenishes the task. This rule
  * works fine for implicit deadline tasks (deadline = period), and the
  * CBS was designed for implicit deadline tasks. However, a task with
- * constrained deadline (deadine < period) might be awakened after the
+ * constrained deadline (deadline < period) might be awakened after the
  * deadline, but before the next period. In this case, replenishing the
  * task would allow it to run for runtime / deadline. As in this case
  * deadline < period, CBS enables a task to run for more than the
-- 
2.25.1
