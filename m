From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 17 Jul 2010 15:20:07 +0000
Subject: [PATCH 4/5] tools: perf: fix sign bug
Message-Id: <1279380007-15272-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@elte.hu>, Arnaldo Carvalho de Melo <acme@redhat.com>, Frederic Weisbecker <fweisbec@gmail.com>, Masami Hiramatsu <mhiramat@redhat.com>, linux-kernel@vger.kernel.org

'i' is unsigned, so this code is wrong if ext is long enough:

    i = strlen(argv[0]) - strlen(ext);
    if (i > 0 && !strcmp(argv[0] + i, ext)) { ... }

Make it signed.


The semantic patch that finds this problem (many false-positive results):
(http://coccinelle.lip6.fr/)

// <smpl>
@ r1 @
identifier f;
@@
int f(...) { ... }

@@
identifier r1.f;
type T;
unsigned T x;
@@

*x = f(...)
 ...
*x > 0

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 tools/perf/perf.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tools/perf/perf.c b/tools/perf/perf.c
index cdd6c03..cfb857f 100644
--- a/tools/perf/perf.c
+++ b/tools/perf/perf.c
@@ -332,7 +332,7 @@ static void handle_internal_command(int argc, const char **argv)
 		{ "test",	cmd_test,	0 },
 		{ "inject",	cmd_inject,	0 },
 	};
-	unsigned int i;
+	int i;
 	static const char ext[] = STRIP_EXTENSION;
 
 	if (sizeof(ext) > 1) {
-- 
1.7.0.4

