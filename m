From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Thu, 07 May 2020 19:30:08 +0000
Subject: [PATCH] tracing/probe: reverse arguments to list_add
Message-Id: <1588879808-24488-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, Nic Volanschi <eugene.volanschi@inria.fr>

Elsewhere in the file, the function trace_kprobe_has_same_kprobe uses
a trace_probe_event.probes object as the second argument of
list_for_each_entry, ie as a list head, while the list_for_each_entry
iterates over the list fields of the trace_probe structures, making
them the list elements.  So, exchange the arguments on the list_add
call to put the list head in the second argument.

Since both list_head structures were just initialized, this problem
did not cause any loss of information.

Fixes: 60d53e2c3b75 ("tracing/probe: Split trace_event related data from trace_probe")
Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 kernel/trace/trace_probe.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_probe.c b/kernel/trace/trace_probe.c
index ab8b6436d53f..b8a928e925c7 100644
--- a/kernel/trace/trace_probe.c
+++ b/kernel/trace/trace_probe.c
@@ -1006,7 +1006,7 @@ int trace_probe_init(struct trace_probe *tp, const char *event,
 	INIT_LIST_HEAD(&tp->event->class.fields);
 	INIT_LIST_HEAD(&tp->event->probes);
 	INIT_LIST_HEAD(&tp->list);
-	list_add(&tp->event->probes, &tp->list);
+	list_add(&tp->list, &tp->event->probes);
 
 	call = trace_probe_event_call(tp);
 	call->class = &tp->event->class;
