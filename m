From: Colin King <colin.king@canonical.com>
Date: Mon, 29 Oct 2018 23:32:11 +0000
Subject: [PATCH] perf/core: clean up inconsisent indentation
Message-Id: <20181029233211.21475-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Replace a bunch of spaces with tab, cleans up indentation

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/events/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index 8c490130c4fb..84530ab358c3 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -750,7 +750,7 @@ static inline void update_cgrp_time_from_event(struct perf_event *event)
 	/*
 	 * Do not update time when cgroup is not active
 	 */
-       if (cgroup_is_descendant(cgrp->css.cgroup, event->cgrp->css.cgroup))
+	if (cgroup_is_descendant(cgrp->css.cgroup, event->cgrp->css.cgroup))
 		__update_cgrp_time(event->cgrp);
 }
 
-- 
2.19.1
