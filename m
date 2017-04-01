From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Sat, 01 Apr 2017 02:10:58 +0000
Subject: [PATCH 6/9] perf utils: Fix spelling mistake: "Invalud" -> "Invalid"
Message-Id: <20170401021101.10198-7-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170401021101.10198-1-acme@kernel.org>
In-Reply-To: <20170401021101.10198-1-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Krister Johansen <kjlx@templeofstupid.com>, Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_debug message.

Signed-off-by: Colin King <colin.king@canonical.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Krister Johansen <kjlx@templeofstupid.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org
Link: http://lkml.kernel.org/r/20170330095440.19444-1-colin.king@canonical.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/hist.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
index 3c4d4d00cb2c..61bf304206fd 100644
--- a/tools/perf/util/hist.c
+++ b/tools/perf/util/hist.c
@@ -2459,7 +2459,7 @@ int parse_filter_percentage(const struct option *opt __maybe_unused,
 	else if (!strcmp(arg, "absolute"))
 		symbol_conf.filter_relative = false;
 	else {
-		pr_debug("Invalud percentage: %s\n", arg);
+		pr_debug("Invalid percentage: %s\n", arg);
 		return -1;
 	}
 
-- 
2.9.3

