From: Andrzej Hajda <a.hajda@samsung.com>
Date: Tue, 06 Oct 2015 09:00:17 +0000
Subject: [PATCH] perf tools: fix handling read result
Message-Id: <1444122017-16856-1-git-send-email-a.hajda@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, kernel-janitors@vger.kernel.org

The function can return negative value, assigning it to unsigned
variable can cause memory corruption.

The problem has been detected using proposed semantic patch
scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2038576

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 tools/perf/util/event.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/event.c b/tools/perf/util/event.c
index cb98b5a..8b10621 100644
--- a/tools/perf/util/event.c
+++ b/tools/perf/util/event.c
@@ -67,7 +67,8 @@ static int perf_event__get_comm_ids(pid_t pid, char *comm, size_t len,
 	char filename[PATH_MAX];
 	char bf[4096];
 	int fd;
-	size_t size = 0, n;
+	size_t size = 0;
+	ssize_t n;
 	char *nl, *name, *tgids, *ppids;
 
 	*tgid = -1;
-- 
1.9.1

