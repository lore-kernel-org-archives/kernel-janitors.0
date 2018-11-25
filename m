From: Colin King <colin.king@canonical.com>
Date: Sun, 25 Nov 2018 23:38:41 +0000
Subject: [PATCH] perf: util: fix spelling mistake "Muliplier" -> "Multiplier"
Message-Id: <20181125233841.14942-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two instances of spelling mistakes of Multiplier, fix
these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/perf/util/intel-bts.c | 2 +-
 tools/perf/util/intel-pt.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/intel-bts.c b/tools/perf/util/intel-bts.c
index 7b27d77306c2..075747492a52 100644
--- a/tools/perf/util/intel-bts.c
+++ b/tools/perf/util/intel-bts.c
@@ -851,7 +851,7 @@ static int intel_bts_synth_events(struct intel_bts *bts,
 static const char * const intel_bts_info_fmts[] = {
 	[INTEL_BTS_PMU_TYPE]		= "  PMU Type           %"PRId64"\n",
 	[INTEL_BTS_TIME_SHIFT]		= "  Time Shift         %"PRIu64"\n",
-	[INTEL_BTS_TIME_MULT]		= "  Time Muliplier     %"PRIu64"\n",
+	[INTEL_BTS_TIME_MULT]		= "  Time Multiplier    %"PRIu64"\n",
 	[INTEL_BTS_TIME_ZERO]		= "  Time Zero          %"PRIu64"\n",
 	[INTEL_BTS_CAP_USER_TIME_ZERO]	= "  Cap Time Zero      %"PRId64"\n",
 	[INTEL_BTS_SNAPSHOT_MODE]	= "  Snapshot mode      %"PRId64"\n",
diff --git a/tools/perf/util/intel-pt.c b/tools/perf/util/intel-pt.c
index 149ff361ca78..38fb12e11569 100644
--- a/tools/perf/util/intel-pt.c
+++ b/tools/perf/util/intel-pt.c
@@ -2376,7 +2376,7 @@ static int intel_pt_perf_config(const char *var, const char *value, void *data)
 static const char * const intel_pt_info_fmts[] = {
 	[INTEL_PT_PMU_TYPE]		= "  PMU Type            %"PRId64"\n",
 	[INTEL_PT_TIME_SHIFT]		= "  Time Shift          %"PRIu64"\n",
-	[INTEL_PT_TIME_MULT]		= "  Time Muliplier      %"PRIu64"\n",
+	[INTEL_PT_TIME_MULT]		= "  Time Multiplier     %"PRIu64"\n",
 	[INTEL_PT_TIME_ZERO]		= "  Time Zero           %"PRIu64"\n",
 	[INTEL_PT_CAP_USER_TIME_ZERO]	= "  Cap Time Zero       %"PRId64"\n",
 	[INTEL_PT_TSC_BIT]		= "  TSC bit             %#"PRIx64"\n",
-- 
2.19.1
