From: "tip-bot2 for Colin Ian King" <tip-bot2@linutronix.de>
Date: Sat, 23 Nov 2019 08:14:59 +0000
Subject: [tip: perf/core] perf probe: Fix spelling mistake "addrees" -> "address"
Message-Id: <157449689986.21853.15487968552772349737.tip-bot2@tip-bot2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121092623.374896-1-colin.king@canonical.com>
In-Reply-To: <20191121092623.374896-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tip-commits@vger.kernel.org
Cc: Colin King <colin.king@canonical.com>, Masami Hiramatsu <mhiramat@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>

The following commit has been merged into the perf/core branch of tip:

Commit-ID:     358f98ee8a3578bbf464ac767b726c5de1ce0647
Gitweb:        https://git.kernel.org/tip/358f98ee8a3578bbf464ac767b726c5de1ce0647
Author:        Colin Ian King <colin.king@canonical.com>
AuthorDate:    Thu, 21 Nov 2019 09:26:23 
Committer:     Arnaldo Carvalho de Melo <acme@redhat.com>
CommitterDate: Fri, 22 Nov 2019 10:48:14 -03:00

perf probe: Fix spelling mistake "addrees" -> "address"

There is a spelling mistake in a pr_warning message. Fix it.

Signed-off-by: Colin King <colin.king@canonical.com>
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org
Link: http://lore.kernel.org/lkml/20191121092623.374896-1-colin.king@canonical.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/probe-finder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
index 38d6cd2..c470c49 100644
--- a/tools/perf/util/probe-finder.c
+++ b/tools/perf/util/probe-finder.c
@@ -812,7 +812,7 @@ static int verify_representive_line(struct probe_finder *pf, const char *fname,
 	if (strcmp(fname, __fname) || lineno = __lineno)
 		return 0;
 
-	pr_warning("This line is sharing the addrees with other lines.\n");
+	pr_warning("This line is sharing the address with other lines.\n");
 
 	if (pf->pev->point.function) {
 		/* Find best match function name and lines */
