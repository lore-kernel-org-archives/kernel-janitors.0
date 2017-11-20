From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Nov 2017 15:30:13 +0000
Subject: [PATCH] perf stat: Fix duplicate error messages in perf_stat_synthesize_config()
Message-Id: <50004e9c-14f8-5a01-fa96-001d32e7c2b2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: David Ahern <dsahern@gmail.com>, Kan Liang <kan.liang@intel.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 20 Nov 2017 15:55:25 +0100

Duplicate error messages were used so far in this function implementation.
Make them unique instead.

This issue was detected by using the Coccinelle software.

Fixes: 7b60a7e3a687481553d2b6ec7e6390a6e82f1849 ("perf stat record: Synthesize event update events")
Fixes: 8b99b1a4e0b082ea6a277766982dac84483d4d3c ("perf stat record: Synthesize stat record data")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 tools/perf/builtin-stat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-stat.c b/tools/perf/builtin-stat.c
index 59af5a8419e2..ed0f23bb2230 100644
--- a/tools/perf/builtin-stat.c
+++ b/tools/perf/builtin-stat.c
@@ -512,7 +512,7 @@ static int perf_stat_synthesize_config(bool is_pipe)
 		if (counter->own_cpus) {
 			err = perf_event__synthesize_event_update_cpus(NULL, counter, process_synthesized_event);
 			if (err < 0) {
-				pr_err("Couldn't synthesize evsel scale.\n");
+				pr_err("Couldn't synthesize evsel CPUs.\n");
 				return err;
 			}
 		}
@@ -541,7 +541,7 @@ static int perf_stat_synthesize_config(bool is_pipe)
 	err = perf_event__synthesize_cpu_map(NULL, evsel_list->cpus,
 					     process_synthesized_event, NULL);
 	if (err < 0) {
-		pr_err("Couldn't synthesize thread map.\n");
+		pr_err("Couldn't synthesize CPU map.\n");
 		return err;
 	}
 
-- 
2.15.0

