From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 21:08:16 +0000
Subject: [PATCH] rcu: remove initialization of static per-cpu variable
Message-Id: <20080612210816.GC3283@damson.getinternet.no>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 22:05:42 +0200
Subject: [PATCH] rcu: remove initialization of static per-cpu variable

Cc: Dipankar Sarma <dipankar@in.ibm.com>
Cc: Josh Triplett <josh@freedesktop.org>
Signed-off-by: Vegard Nossum <vegard.nossum@gmail.com>
---
 kernel/rcupdate.c   |    2 +-
 kernel/rcutorture.c |    6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/rcupdate.c b/kernel/rcupdate.c
index c09605f..aa2ad88 100644
--- a/kernel/rcupdate.c
+++ b/kernel/rcupdate.c
@@ -51,7 +51,7 @@ struct rcu_synchronize {
 	struct completion completion;
 };
 
-static DEFINE_PER_CPU(struct rcu_head, rcu_barrier_head) = {NULL};
+static DEFINE_PER_CPU(struct rcu_head, rcu_barrier_head);
 static atomic_t rcu_barrier_cpu_count;
 static DEFINE_MUTEX(rcu_barrier_mutex);
 static struct completion rcu_barrier_completion;
diff --git a/kernel/rcutorture.c b/kernel/rcutorture.c
index 33acc42..76840a1 100644
--- a/kernel/rcutorture.c
+++ b/kernel/rcutorture.c
@@ -107,10 +107,8 @@ static struct rcu_torture *rcu_torture_current = NULL;
 static long rcu_torture_current_version = 0;
 static struct rcu_torture rcu_tortures[10 * RCU_TORTURE_PIPE_LEN];
 static DEFINE_SPINLOCK(rcu_torture_lock);
-static DEFINE_PER_CPU(long [RCU_TORTURE_PIPE_LEN + 1], rcu_torture_count) -	{ 0 };
-static DEFINE_PER_CPU(long [RCU_TORTURE_PIPE_LEN + 1], rcu_torture_batch) -	{ 0 };
+static DEFINE_PER_CPU(long [RCU_TORTURE_PIPE_LEN + 1], rcu_torture_count);
+static DEFINE_PER_CPU(long [RCU_TORTURE_PIPE_LEN + 1], rcu_torture_batch);
 static atomic_t rcu_torture_wcount[RCU_TORTURE_PIPE_LEN + 1];
 static atomic_t n_rcu_torture_alloc;
 static atomic_t n_rcu_torture_alloc_fail;
-- 
1.5.4.1

