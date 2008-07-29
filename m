From: Alexander Beregalov <a.beregalov@gmail.com>
Date: Tue, 29 Jul 2008 19:00:26 +0000
Subject: [RFC][PATCH] kernel/profile.c: fix warnings
Message-Id: <20080729190026.GA32433@orion>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@redhat.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi

Moved these three functions under ifdef CONFIG_PROC_FS, separated
profile_hits. Perhaps it would be better to join two ifdef-CONFIG_PROC_FS
blocks. 
This patch is on top of 2.6.27-rc1.

From: Alexander Beregalov <a.beregalov@gmail.com>

kernel/profile.c: fix warnings:

kernel/profile.c:245: warning: 'profile_flip_buffers' defined but not
used
kernel/profile.c:268: warning: 'profile_discard_flip_buffers' defined
but not used
kernel/profile.c:335: warning: 'profile_cpu_callback' defined but not
used

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>

---

 kernel/profile.c |  107 ++++++++++++++++++++++++++++--------------------------
 1 files changed, 56 insertions(+), 51 deletions(-)

diff --git a/kernel/profile.c b/kernel/profile.c
index cd26bed..0f377d9 100644
--- a/kernel/profile.c
+++ b/kernel/profile.c
@@ -202,6 +202,7 @@ void unregister_timer_hook(int (*hook)(struct pt_regs *))
 EXPORT_SYMBOL_GPL(unregister_timer_hook);
 
 
+#ifdef CONFIG_PROC_FS
 #ifdef CONFIG_SMP
 /*
  * Each cpu has a pair of open-addressed hashtables for pending
@@ -279,57 +280,6 @@ static void profile_discard_flip_buffers(void)
 	mutex_unlock(&profile_flip_mutex);
 }
 
-void profile_hits(int type, void *__pc, unsigned int nr_hits)
-{
-	unsigned long primary, secondary, flags, pc = (unsigned long)__pc;
-	int i, j, cpu;
-	struct profile_hit *hits;
-
-	if (prof_on != type || !prof_buffer)
-		return;
-	pc = min((pc - (unsigned long)_stext) >> prof_shift, prof_len - 1);
-	i = primary = (pc & (NR_PROFILE_GRP - 1)) << PROFILE_GRPSHIFT;
-	secondary = (~(pc << 1) & (NR_PROFILE_GRP - 1)) << PROFILE_GRPSHIFT;
-	cpu = get_cpu();
-	hits = per_cpu(cpu_profile_hits, cpu)[per_cpu(cpu_profile_flip, cpu)];
-	if (!hits) {
-		put_cpu();
-		return;
-	}
-	/*
-	 * We buffer the global profiler buffer into a per-CPU
-	 * queue and thus reduce the number of global (and possibly
-	 * NUMA-alien) accesses. The write-queue is self-coalescing:
-	 */
-	local_irq_save(flags);
-	do {
-		for (j = 0; j < PROFILE_GRPSZ; ++j) {
-			if (hits[i + j].pc = pc) {
-				hits[i + j].hits += nr_hits;
-				goto out;
-			} else if (!hits[i + j].hits) {
-				hits[i + j].pc = pc;
-				hits[i + j].hits = nr_hits;
-				goto out;
-			}
-		}
-		i = (i + secondary) & (NR_PROFILE_HIT - 1);
-	} while (i != primary);
-
-	/*
-	 * Add the current hit(s) and flush the write-queue out
-	 * to the global buffer:
-	 */
-	atomic_add(nr_hits, &prof_buffer[pc]);
-	for (i = 0; i < NR_PROFILE_HIT; ++i) {
-		atomic_add(hits[i].hits, &prof_buffer[hits[i].pc]);
-		hits[i].pc = hits[i].hits = 0;
-	}
-out:
-	local_irq_restore(flags);
-	put_cpu();
-}
-
 static int __devinit profile_cpu_callback(struct notifier_block *info,
 					unsigned long action, void *__cpu)
 {
@@ -390,7 +340,62 @@ out_free:
 #define profile_flip_buffers()		do { } while (0)
 #define profile_discard_flip_buffers()	do { } while (0)
 #define profile_cpu_callback		NULL
+#endif
+#endif /* CONFIG_PROC_FS */
 
+#ifdef CONFIG_SMP
+void profile_hits(int type, void *__pc, unsigned int nr_hits)
+{
+	unsigned long primary, secondary, flags, pc = (unsigned long)__pc;
+	int i, j, cpu;
+	struct profile_hit *hits;
+
+	if (prof_on != type || !prof_buffer)
+		return;
+	pc = min((pc - (unsigned long)_stext) >> prof_shift, prof_len - 1);
+	i = primary = (pc & (NR_PROFILE_GRP - 1)) << PROFILE_GRPSHIFT;
+	secondary = (~(pc << 1) & (NR_PROFILE_GRP - 1)) << PROFILE_GRPSHIFT;
+	cpu = get_cpu();
+	hits = per_cpu(cpu_profile_hits, cpu)[per_cpu(cpu_profile_flip, cpu)];
+	if (!hits) {
+		put_cpu();
+		return;
+	}
+	/*
+	 * We buffer the global profiler buffer into a per-CPU
+	 * queue and thus reduce the number of global (and possibly
+	 * NUMA-alien) accesses. The write-queue is self-coalescing:
+	 */
+	local_irq_save(flags);
+	do {
+		for (j = 0; j < PROFILE_GRPSZ; ++j) {
+			if (hits[i + j].pc = pc) {
+				hits[i + j].hits += nr_hits;
+				goto out;
+			} else if (!hits[i + j].hits) {
+				hits[i + j].pc = pc;
+				hits[i + j].hits = nr_hits;
+				goto out;
+			}
+		}
+		i = (i + secondary) & (NR_PROFILE_HIT - 1);
+	} while (i != primary);
+
+	/*
+	 * Add the current hit(s) and flush the write-queue out
+	 * to the global buffer:
+	 */
+	atomic_add(nr_hits, &prof_buffer[pc]);
+	for (i = 0; i < NR_PROFILE_HIT; ++i) {
+		atomic_add(hits[i].hits, &prof_buffer[hits[i].pc]);
+		hits[i].pc = hits[i].hits = 0;
+	}
+out:
+	local_irq_restore(flags);
+	put_cpu();
+}
+
+#else /* !CONFIG_SMP */
 void profile_hits(int type, void *__pc, unsigned int nr_hits)
 {
 	unsigned long pc;
