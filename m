From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Apr 2017 08:59:49 +0000
Subject: [PATCH] perf/core: Remove some dead code
Message-Id: <20170411085949.GB24157@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

perf_init_event() never returns NULL, only error pointer.  The check for
NULL causes a static checker warning and it seems slightly buggy to do
a goto err_ns without setting the error code so those are two other
reasons to delete this.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 6e75a5c9412d..0028efa0abc3 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -9172,7 +9172,7 @@ static int perf_try_init_event(struct pmu *pmu, struct perf_event *event)
 
 static struct pmu *perf_init_event(struct perf_event *event)
 {
-	struct pmu *pmu = NULL;
+	struct pmu *pmu;
 	int idx;
 	int ret;
 
@@ -9456,9 +9456,7 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 	}
 
 	pmu = perf_init_event(event);
-	if (!pmu)
-		goto err_ns;
-	else if (IS_ERR(pmu)) {
+	if (IS_ERR(pmu)) {
 		err = PTR_ERR(pmu);
 		goto err_ns;
 	}
