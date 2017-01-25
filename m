From: Arnaldo Carvalho de Melo <acme@kernel.org>
Date: Wed, 25 Jan 2017 13:53:39 +0000
Subject: [PATCH 12/23] perf probe: Delete an unnecessary check in try_to_find_absolute_address()
Message-Id: <20170125135350.22983-13-acme@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170125135350.22983-1-acme@kernel.org>
In-Reply-To: <20170125135350.22983-1-acme@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Markus Elfring <elfring@users.sourceforge.net>, Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, He Kuang <hekuang@huawei.com>, Jiri Olsa <jolsa@kernel.org>, Milian Wolff <milian.wolff@kdab.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>, kernel-janitors@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>

Remove a condition check which is unnecessary at the end
because this source code place should usually only be reached
with a non-zero pointer.

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
Link: http://lkml.kernel.org/r/a3f2473b-6383-a326-bce0-b826423608b8@users.sourceforge.net
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/probe-event.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
index 4a57c8a60bd9..cdfc468d4d5f 100644
--- a/tools/perf/util/probe-event.c
+++ b/tools/perf/util/probe-event.c
@@ -3004,10 +3004,8 @@ static int try_to_find_absolute_address(struct perf_probe_event *pev,
 	return 1;
 
 errout:
-	if (*tevs) {
-		clear_probe_trace_events(*tevs, 1);
-		*tevs = NULL;
-	}
+	clear_probe_trace_events(*tevs, 1);
+	*tevs = NULL;
 	return err;
 }
 
-- 
2.9.3

