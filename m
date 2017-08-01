From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Aug 2017 11:02:01 +0000
Subject: [PATCH] tracing: missing error code in tracer_alloc_buffers()
Message-Id: <20170801110201.ajdkct7vwzixahvx@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If ring_buffer_alloc() or one of the next couple function calls fail
then we should return -ENOMEM but the current code returns success.

Fixes: b32614c03413 ('tracing/rb: Convert to hotplug state machine')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 42b9355033d4..625c00aab800 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -8293,6 +8293,7 @@ __init static int tracer_alloc_buffers(void)
 	if (ret < 0)
 		goto out_free_cpumask;
 	/* Used for event triggers */
+	ret = -ENOMEM;
 	temp_buffer = ring_buffer_alloc(PAGE_SIZE, RB_FL_OVERWRITE);
 	if (!temp_buffer)
 		goto out_rm_hp_state;
