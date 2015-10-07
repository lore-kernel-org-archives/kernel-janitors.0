From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Wed, 07 Oct 2015 22:45:16 +0000
Subject: [PATCH 4/5] perf tools: Fix handling read result using a signed variable
Message-Id: <1444257917-24527-5-git-send-email-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1444257917-24527-1-git-send-email-acme@kernel.org>
In-Reply-To: <1444257917-24527-1-git-send-email-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Andrzej Hajda <a.hajda@samsung.com>

The function can return negative value, assigning it to unsigned
variable can cause memory corruption.

The problem has been detected using proposed semantic patch
scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2038576

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: kernel-janitors@vger.kernel.org
Link: http://lkml.kernel.org/r/1444122017-16856-1-git-send-email-a.hajda@samsung.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/event.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/event.c b/tools/perf/util/event.c
index cb98b5af9e17..8b10621b415c 100644
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
2.1.0

