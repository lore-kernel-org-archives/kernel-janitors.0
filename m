From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 May 2017 09:03:49 +0000
Subject: [PATCH v2 1/2] perf/core: remove some dead code
Message-Id: <20170522090348.5g7yyld5en3yeky4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

perf_init_event() can't return NULL.  If it did, the error handling is
incomplete and we would crash.  I have removed this confusing dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: split it up

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 13f5b942580b..4c24bc4c8a63 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9177,7 +9177,7 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 
 static struct pmu *perf_init_event(struct perf_event *event)
 {
-	struct pmu *pmu = NULL;
+	struct pmu *pmu;
 	int idx;
 	int ret;
 
@@ -9461,9 +9461,7 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	}
 
 	pmu = perf_init_event(event);
-	if (!pmu)
-		goto err_ns;
-	else if (IS_ERR(pmu)) {
+	if (IS_ERR(pmu)) {
 		err = PTR_ERR(pmu);
 		goto err_ns;
 	}
