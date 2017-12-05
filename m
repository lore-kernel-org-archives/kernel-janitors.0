From: rodrigosiqueira <rodrigosiqueiramelo@gmail.com>
Date: Tue, 05 Dec 2017 14:02:00 +0000
Subject: [PATCH] Scheduler: Removed first parameter from prepare_lock_switch
Message-Id: <20171205140200.4guikhmagltvoehm@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peterz@infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The first parameter of prepare_lock_switch (kernel/sched/sched.h) is not
used anymore. Commit c55f5158f removed the code that use the first
parameter and function prepare_lock_switch is only used in
prepare_task_switch (kernel/sched/core.c)

I tested it in a virtual machine running Debian x86_64 with kvm. I
also tested it in my computer which is a x86_64 machine running Arch Linux
and everything is fine.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 kernel/sched/core.c  | 2 +-
 kernel/sched/sched.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c85dfb746f8c..0b1781cfa0ca 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2592,7 +2592,7 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
 	sched_info_switch(rq, prev, next);
 	perf_event_task_sched_out(prev, next);
 	fire_sched_out_preempt_notifiers(prev, next);
-	prepare_lock_switch(rq, next);
+	prepare_lock_switch(next);
 	prepare_arch_switch(next);
 }
 
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b19552a212de..089953e4ec66 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1328,7 +1328,7 @@ static inline int task_on_rq_migrating(struct task_struct *p)
 # define finish_arch_post_lock_switch()	do { } while (0)
 #endif
 
-static inline void prepare_lock_switch(struct rq *rq, struct task_struct *next)
+static inline void prepare_lock_switch(struct task_struct *next)
 {
 #ifdef CONFIG_SMP
 	/*
-- 
2.15.1

