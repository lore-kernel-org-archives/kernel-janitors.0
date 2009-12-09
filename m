From: Julia Lawall <julia@diku.dk>
Date: Wed, 09 Dec 2009 19:26:18 +0000
Subject: [PATCH 12/12] tools/perf: Correct size given to memset
Message-Id: <Pine.LNX.4.64.0912092026000.1870@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Memset should be given the size of the structure, not the size of the pointer.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
expression E;
@@

memset(x, E, sizeof(
+ *
 x))
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 tools/perf/util/probe-event.c       |    2 +-
 tools/perf/util/trace-event-parse.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
--- a/tools/perf/util/probe-event.c
+++ b/tools/perf/util/probe-event.c
@@ -376,7 +376,7 @@ static void clear_probe_point(struct pro
 		free(pp->args);
 	for (i = 0; i < pp->found; i++)
 		free(pp->probes[i]);
-	memset(pp, 0, sizeof(pp));
+	memset(pp, 0, sizeof(*pp));
 }
 
 /* List up current perf-probe events */
diff -u -p a/tools/perf/util/trace-event-parse.c b/tools/perf/util/trace-event-parse.c
--- a/tools/perf/util/trace-event-parse.c
+++ b/tools/perf/util/trace-event-parse.c
@@ -1477,7 +1477,7 @@ process_fields(struct event *event, stru
 			goto out_free;
 
 		field = malloc_or_die(sizeof(*field));
-		memset(field, 0, sizeof(field));
+		memset(field, 0, sizeof(*field));
 
 		value = arg_eval(arg);
 		field->value = strdup(value);
