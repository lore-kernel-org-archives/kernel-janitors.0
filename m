From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Mon, 06 Jul 2015 15:41:29 +0000
Subject: [PATCH 09/11] perf probe: Delete an unnecessary check before the function call "strfilter__delete"
Message-Id: <1436197291-21625-10-git-send-email-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436197291-21625-1-git-send-email-acme@kernel.org>
In-Reply-To: <1436197291-21625-1-git-send-email-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Markus Elfring <elfring@users.sourceforge.net>, Julia Lawall <julia.lawall@lip6.fr>, Peter Zijlstra <a.p.zijlstra@chello.nl>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>

The strfilter__delete() function tests whether its argument is NULL and
then returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Acked-by: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: kernel-janitors@vger.kernel.org
Link: http://lkml.kernel.org/r/5597751A.5000506@users.sourceforge.net
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/builtin-probe.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/perf/builtin-probe.c b/tools/perf/builtin-probe.c
index 1272559fa22d..b81cec33b4b2 100644
--- a/tools/perf/builtin-probe.c
+++ b/tools/perf/builtin-probe.c
@@ -297,8 +297,7 @@ static void cleanup_params(void)
 		clear_perf_probe_event(params.events + i);
 	line_range__clear(&params.line_range);
 	free(params.target);
-	if (params.filter)
-		strfilter__delete(params.filter);
+	strfilter__delete(params.filter);
 	memset(&params, 0, sizeof(params));
 }
 
-- 
2.1.0

