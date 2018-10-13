From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 13 Oct 2018 10:19:40 +0000
Subject: [PATCH] perf stat: Potential NULL dereference in print_aggr()
Message-Id: <20181013101940.GA16086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that:

    ./tools/perf/util/stat-display.c:616 print_aggr()
    error: we previously assumed 'config->aggr_map' could be null (see line 607)

Not only that, but it looks like aggr_update_shadow() can Oops if
"config->aggr_get_id" is NULL.  The intent seems to have been to return
if either of these pointers is NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 tools/perf/util/stat-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
index e7b4c44ebb62..db635c01d3a3 100644
--- a/tools/perf/util/stat-display.c
+++ b/tools/perf/util/stat-display.c
@@ -604,7 +604,7 @@ static void print_aggr(struct perf_stat_config *config,
 	u64 ena, run, val;
 	bool first;
 
-	if (!(config->aggr_map || config->aggr_get_id))
+	if (!config->aggr_map || !config->aggr_get_id)
 		return;
 
 	aggr_update_shadow(config, evlist);
-- 
2.18.0
