From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Wed, 25 Jan 2017 13:53:40 +0000
Subject: [PATCH 13/23] perf probe: Delete an unnecessary assignment in try_to_find_absolute_address()
Message-Id: <20170125135350.22983-14-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170125135350.22983-1-acme@kernel.org>
In-Reply-To: <20170125135350.22983-1-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Markus Elfring <elfring@users.sourceforge.net>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, He Kuang <hekuang@huawei.com>, Jiri Olsa <jolsa@kernel.org>, Milian Wolff <milian.wolff@kdab.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>

Remove an error code assignment which is redundant in an if branch for
the handling of a memory allocation failure because the same value was
set for the local variable "err" before.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: He Kuang <hekuang@huawei.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Milian Wolff <milian.wolff@kdab.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>
Cc: Wang Nan <wangnan0@huawei.com>
Cc: kernel-janitors@vger.kernel.org
Link: http://lkml.kernel.org/r/0ede09ec-79b6-c8bd-5b20-02c63ed98aab@users.sourceforge.net
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/probe-event.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
index cdfc468d4d5f..ded1e7d88874 100644
--- a/tools/perf/util/probe-event.c
+++ b/tools/perf/util/probe-event.c
@@ -2994,10 +2994,9 @@ static int try_to_find_absolute_address(struct perf_probe_event *pev,
 
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
2.9.3

