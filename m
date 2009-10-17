From: Julia Lawall <julia@diku.dk>
Date: Sat, 17 Oct 2009 06:43:17 +0000
Subject: [PATCH 14/14] tools/perf: Move dereference after NULL test
Message-Id: <Pine.LNX.4.64.0910170842500.9213@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, if the NULL test on thread is needed, then the dereference
should be after the NULL test.

A simplified version of the semantic match that detects this problem is as
follows (http://coccinelle.lip6.fr/):

// <smpl>
@match exists@
expression x, E;
identifier fld;
@@

* x->fld
  ... when != \(x = E\|&x\)
* x = NULL
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 tools/perf/builtin-annotate.c |    4 ++--
 tools/perf/builtin-report.c   |    4 ++--
 tools/perf/builtin-sched.c    |    4 ++--
 tools/perf/builtin-trace.c    |    4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
index 6b00529..6e580ff 100644
--- a/tools/perf/builtin-sched.c
+++ b/tools/perf/builtin-sched.c
@@ -1581,14 +1581,14 @@ process_sample_event(event_t *event, unsigned long offset, unsigned long head)
 		(void *)(long)ip,
 		(long long)period);
 
-	dump_printf(" ... thread: %s:%d\n", thread->comm, thread->pid);
-
 	if (thread = NULL) {
 		eprintf("problem processing %d event, skipping it.\n",
 			event->header.type);
 		return -1;
 	}
 
+	dump_printf(" ... thread: %s:%d\n", thread->comm, thread->pid);
+
 	process_raw_event(event, more_data, cpu, timestamp, thread);
 
 	return 0;
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index f57a23b..df265e2 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -634,14 +634,14 @@ process_sample_event(event_t *event, unsigned long offset, unsigned long head)
 		}
 	}
 
-	dump_printf(" ... thread: %s:%d\n", thread->comm, thread->pid);
-
 	if (thread = NULL) {
 		eprintf("problem processing %d event, skipping it.\n",
 			event->header.type);
 		return -1;
 	}
 
+	dump_printf(" ... thread: %s:%d\n", thread->comm, thread->pid);
+
 	if (comm_list && !strlist__has_entry(comm_list, thread->comm))
 		return 0;
 
diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index 8c84320..7c1fa3a 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -110,14 +110,14 @@ process_sample_event(event_t *event, unsigned long offset, unsigned long head)
 		event->ip.pid,
 		(void *)(long)ip);
 
-	dump_printf(" ... thread: %s:%d\n", thread->comm, thread->pid);
-
 	if (thread = NULL) {
 		fprintf(stderr, "problem processing %d event, skipping it.\n",
 			event->header.type);
 		return -1;
 	}
 
+	dump_printf(" ... thread: %s:%d\n", thread->comm, thread->pid);
+
 	if (event->header.misc & PERF_RECORD_MISC_KERNEL) {
 		level = 'k';
 		sym = kernel_maps__find_symbol(ip, &map);
diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
index fb3f3c2..b9c4371 100644
--- a/tools/perf/builtin-trace.c
+++ b/tools/perf/builtin-trace.c
@@ -87,14 +87,14 @@ process_sample_event(event_t *event, unsigned long offset, unsigned long head)
 		(void *)(long)ip,
 		(long long)period);
 
-	dump_printf(" ... thread: %s:%d\n", thread->comm, thread->pid);
-
 	if (thread = NULL) {
 		eprintf("problem processing %d event, skipping it.\n",
 			event->header.type);
 		return -1;
 	}
 
+	dump_printf(" ... thread: %s:%d\n", thread->comm, thread->pid);
+
 	if (sample_type & PERF_SAMPLE_RAW) {
 		struct {
 			u32 size;
