From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Oct 2011 13:27:44 +0000
Subject: [patch] trace: cleanup: make some types unsigned
Message-Id: <20111007132744.GC31424@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem here is that I'm trying to silence a static checker
warning.  In replace_preds() we cap n_preds at MAX_FILTER_PRED but
we don't check for negative values.  It can't actually be negative
values, but the static checkers get confused.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/trace_events_filter.c b/kernel/trace/trace_events_filter.c
index 256764e..7f4daff 100644
--- a/kernel/trace/trace_events_filter.c
+++ b/kernel/trace/trace_events_filter.c
@@ -790,7 +790,7 @@ static struct event_filter *__alloc_filter(void)
 	return filter;
 }
 
-static int __alloc_preds(struct event_filter *filter, int n_preds)
+static int __alloc_preds(struct event_filter *filter, unsigned int n_preds)
 {
 	struct filter_pred *pred;
 	int i;
@@ -1361,10 +1361,10 @@ static int check_preds(struct filter_parse_state *ps)
 	return 0;
 }
 
-static int count_preds(struct filter_parse_state *ps)
+static unsigned int count_preds(struct filter_parse_state *ps)
 {
 	struct postfix_elt *elt;
-	int n_preds = 0;
+	unsigned int n_preds = 0;
 
 	list_for_each_entry(elt, &ps->postfix, list) {
 		if (elt->op = OP_NONE)
@@ -1601,7 +1601,7 @@ static int replace_preds(struct ftrace_event_call *call,
 	struct postfix_elt *elt;
 	struct pred_stack stack = { }; /* init to NULL */
 	int err;
-	int n_preds = 0;
+	unsigned int n_preds = 0;
 
 	n_preds = count_preds(ps);
 	if (n_preds >= MAX_FILTER_PRED) {
