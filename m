From: Hannes Eder <hannes@hanneseder.net>
Date: Tue, 10 Feb 2009 18:44:45 +0000
Subject: [PATCH 3/3] trace: fix sparce warning: attribute function with
Message-Id: <20090210184443.28131.8584.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090210184214.28131.90564.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090210184214.28131.90564.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  kernel/trace/trace.c:458:9: warning: context imbalance in 'register_tracer' - unexpected unlock

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 kernel/trace/trace.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 16b8be4..5762fa5 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -439,6 +439,8 @@ update_max_tr_single(struct trace_array *tr, struct task_struct *tsk, int cpu)
  * Register a new plugin tracer.
  */
 int register_tracer(struct tracer *type)
+__releases(kernel_lock)
+__acquires(kernel_lock)
 {
 	struct tracer *t;
 	int len;

