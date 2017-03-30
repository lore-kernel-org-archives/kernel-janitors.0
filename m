From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Mar 2017 09:54:40 +0000
Subject: [PATCH] perf utils: fix spelling mistake: "Invalud" -> "Invalid"
Message-Id: <20170330095440.19444-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Krister Johansen <kjlx@templeofstupid.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

trivial fix to spelling mistake in pr_debug message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
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
2.11.0

