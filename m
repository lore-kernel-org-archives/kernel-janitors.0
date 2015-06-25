From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Thu, 25 Jun 2015 21:10:13 +0000
Subject: [PATCH 2/7] perf header: Delete an unnecessary check before the calling free_event_desc()
Message-Id: <1435266618-10810-3-git-send-email-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1435266618-10810-1-git-send-email-acme@kernel.org>
In-Reply-To: <1435266618-10810-1-git-send-email-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Markus Elfring <elfring@users.sourceforge.net>, Julia Lawall <julia.lawall@lip6.fr>, Peter Zijlstra <a.p.zijlstra@chello.nl>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>

The free_event_desc() function tests whether its argument is NULL and
then returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: kernel-janitors@vger.kernel.org
Link: http://lkml.kernel.org/r/558C2ABA.3000603@users.sourceforge.net
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/header.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 21a77e7a171e..03ace57a800c 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -1063,8 +1063,7 @@ out:
 	free(buf);
 	return events;
 error:
-	if (events)
-		free_event_desc(events);
+	free_event_desc(events);
 	events = NULL;
 	goto out;
 }
-- 
2.1.0

