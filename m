From: Julia Lawall <julia@diku.dk>
Date: Sun, 06 Dec 2009 09:16:30 +0000
Subject: [PATCH 4/5] tools/perf/util: correct size computation
Message-Id: <Pine.LNX.4.64.0912061016120.20858@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The size argument to zalloc should be the size of desired structure,
not the pointer to it.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@expression@
expression *x;
@@

x  <+...
-sizeof(x)
+sizeof(*x)
...+>// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 tools/perf/util/parse-events.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -197,7 +197,7 @@ struct tracepoint_path *tracepoint_id_to
 			if (id = config) {
 				closedir(evt_dir);
 				closedir(sys_dir);
-				path = zalloc(sizeof(path));
+				path = zalloc(sizeof(*path));
 				path->system = malloc(MAX_EVENT_LENGTH);
 				if (!path->system) {
 					free(path);
