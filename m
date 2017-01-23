From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 15:25:23 +0000
Subject: [PATCH 3/4] perf session: Move an error code assignment in __perf_session__set_tracepoints_handlers(
Message-Id: <b9ccdf98-e7a9-e4a2-67d7-24617d4b87a6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c8eebdee-ad45-c2a8-9a4d-e1032ec9a17f@users.sourceforge.net>
In-Reply-To: <c8eebdee-ad45-c2a8-9a4d-e1032ec9a17f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Hunter <adrian.hunter@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, He Kuang <hekuang@huawei.com>, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Milian Wolff <milian.wolff@kdab.com>, Peter Zijlstra <peterz@infradead.org>, Ravi Bangoria <ravi.bangoria@linux.vnet.ibm.com>, Wang Nan <wangnan0@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 23 Jan 2017 15:43:13 +0100

A local variable was set to an error code before a concrete error situation
was detected. Thus move the corresponding assignment into an if branch
to indicate a software failure there.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 tools/perf/util/session.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index f268201048a0..98605ad4affd 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -2050,10 +2050,10 @@ int __perf_session__set_tracepoints_handlers(struct perf_session *session,
 		evsel = perf_evlist__find_tracepoint_by_name(session->evlist, assocs[i].name);
 		if (evsel = NULL)
 			continue;
-
-		err = -EEXIST;
-		if (evsel->handler != NULL)
+		if (evsel->handler) {
+			err = -EEXIST;
 			goto out;
+		}
 		evsel->handler = assocs[i].handler;
 	}
 
-- 
2.11.0

