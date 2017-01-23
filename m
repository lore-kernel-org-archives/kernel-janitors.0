From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 15:24:06 +0000
Subject: [PATCH 2/4] perf probe: Delete an unnecessary assignment in try_to_find_absolute_address()
Message-Id: <0ede09ec-79b6-c8bd-5b20-02c63ed98aab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c8eebdee-ad45-c2a8-9a4d-e1032ec9a17f@users.sourceforge.net>
In-Reply-To: <c8eebdee-ad45-c2a8-9a4d-e1032ec9a17f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, He Kuang <hekuang@huawei.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Milian Wolff <milian.wolff@kdab.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 15:10:19 +0100

Remove an error code assignment which is redundant in an if branch for
the handling of a memory allocation failure because the same value was set
for the local variable "err" before.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 tools/perf/util/probe-event.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
index 6c7508337fe8..5a34c93b818a 100644
--- a/tools/perf/util/probe-event.c
+++ b/tools/perf/util/probe-event.c
@@ -2956,10 +2956,9 @@ static int try_to_find_absolute_address(struct perf_probe_event *pev,
 
 	tev->nargs = pev->nargs;
 	tev->args = zalloc(sizeof(struct probe_trace_arg) * tev->nargs);
-	if (!tev->args) {
-		err = -ENOMEM;
+	if (!tev->args)
 		goto errout;
-	}
+
 	for (i = 0; i < tev->nargs; i++)
 		copy_to_probe_trace_arg(&tev->args[i], &pev->args[i]);
 
-- 
2.11.0

