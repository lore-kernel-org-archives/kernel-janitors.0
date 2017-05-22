From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 May 2017 09:04:18 +0000
Subject: [PATCH v2 2/2] perf/core: fix error handling in perf_event_alloc()
Message-Id: <20170522090418.hvs6icgpdo53wkn5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We don't set an error code here which means that perf_event_alloc()
returns ERR_PTR(0) (in other words NULL).  The callers are not expecting
that and would Oops.

Fixes: 375637bc5249 ("perf/core: Introduce address range filtering")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: split up the patch

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 13f5b942580b..4c24bc4c8a63 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
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

