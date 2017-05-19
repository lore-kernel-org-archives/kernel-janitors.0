From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 May 2017 21:29:55 +0000
Subject: [PATCH] perf/core: potential NULL deref if perf_event_alloc() fails
Message-Id: <20170519212955.t723zbuywm4x2uwt@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I found this bug by looking for places where we do ERR_PTR(0).  The
callers for perf_event_alloc() don't expect NULL returns and will oops.
At first it looked like perf_init_event() can return NULL, but that's
actually dead code.  I removed it.  But if the kcalloc() fails then we
do need to set err = -ENOMEM.

Fixes: 375637bc5249 ("perf/core: Introduce address range filtering")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

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
@@ -9476,8 +9474,10 @@ perf_event_alloc(struct perf_event_attr *attr, int cpu,
 		event->addr_filters_offs = kcalloc(pmu->nr_addr_filters,
 						   sizeof(unsigned long),
 						   GFP_KERNEL);
-		if (!event->addr_filters_offs)
+		if (!event->addr_filters_offs) {
+			err = -ENOMEM;
 			goto err_per_task;
+		}
 
 		/* force hw sync on the address filters */
 		event->addr_filters_gen = 1;
